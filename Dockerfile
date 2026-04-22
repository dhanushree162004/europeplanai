# --- 1. BASE IMAGE ---
FROM python:3.11-slim

# --- 2. INSTALL SYSTEM DEPS & OLLAMA ---
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama directly into the container
RUN curl -L https://ollama.com/download/ollama-linux-amd64 -o /usr/bin/ollama \
    && chmod +x /usr/bin/ollama

# --- 3. PRE-LOAD MODEL ---
# This runs Ollama in the background, pulls the model, then kills it (saves time at startup)
RUN ollama serve & sleep 5 && ollama pull llama3.2:1b

# --- 4. PREPARE APP ---
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# --- 5. ENVIRONMENT ---
ENV PYTHONUNBUFFERED=1
ENV PORT=7860
ENV LOCAL_LLM_BASE_URL=http://localhost:11434/v1
ENV LLM_MODEL=llama3.2:1b

# --- 6. STARTUP SCRIPT ---
# We use a shell command to start Ollama in background, then start our FastAPI app
CMD ollama serve & sleep 10 && uvicorn backend.main:app --host 0.0.0.0 --port 7860
