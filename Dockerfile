# --- 1. BASE IMAGE ---
FROM python:3.11-slim

# --- 2. INSTALL SYSTEM DEPS & OLLAMA ---
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Official Ollama Installation Script
RUN curl -fsSL https://ollama.com/install.sh | sh

# --- 3. PREPARE APP ---
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# --- 4. ENVIRONMENT ---
ENV PYTHONUNBUFFERED=1
ENV PORT=7860
ENV LOCAL_LLM_BASE_URL=http://localhost:11434/v1
ENV LLM_MODEL=llama3.2:1b

# --- 5. STARTUP SCRIPT ---
# 1. Start Ollama in background
# 2. Wait for it to wake up
# 3. Pull the required model
# 4. Start the FastAPI app
CMD ollama serve & sleep 10 && ollama pull llama3.2:1b && uvicorn backend.main:app --host 0.0.0.0 --port 7860
