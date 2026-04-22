# 🚀 EuroPlan AI Deployment Guide

Depending on whether you use a cloud API (OpenAI/Gemini) or a **Local LLM (Llama 3.2)**, your deployment path will differ.

---

## 🛠 Option A: The "4GB Solution" (Local Tunneling via Ngrok)
*Best for: Large projects (>4GB), Local LLMs (Ollama), and zero-cost hosting.*

Since your project is large (4GB+) and relies on a **Local LLM (Llama 3.2)**, the most efficient deployment is to host it from your machine. This avoids the need to upload 4GB of weights to a cloud server.

1. **Start Ollama & API**:
   Ensure Ollama is running and your backend is live on port 8000.
   ```bash
   uvicorn backend.main:app --port 8000
   ```

2. **Tunnel with Ngrok**:
   Ngrok creates a public gateway to your local machine.
   ```bash
   ngrok http 8000
   ```

3. **Deploy Frontend**:
   Upload only the **frontend** folder to Vercel/Netlify. Update the `fetch()` URL in your JS to point to your new **Ngrok address**.

---

## 🌩 Option B: Hugging Face Spaces (Docker)
*Best for: Persistent large-scale RAG apps.*

Hugging Face Spaces is the most "AI-Native" way to deploy.

### 1. Create your Space
1. Go to **Hugging Face > New Space**.
2. **Name**: `europlan-ai`.
3. **SDK**: Choose **Docker**.
4. **License**: Open Source (MIT/Apache).

### 2. Prepare the Code
Push your code to the HF Space's Git repository.
- Ensure your `Dockerfile` (or `docker-compose.yml`) is in the root.
- HF Spaces automatically gives you a public URL.

### 3. Handle Docker
Hugging Face will detect your `Dockerfile`. Ensure yours looks like this:
```dockerfile
FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "7860"]
```
*Note: HF Spaces uses port 7860 by default.*

---

## 🌩 Option C: Railway.app (Cloud Deployment)
Railway is excellent for Python apps because it handles dependencies and environment variables with zero configuration.

### 1. Preparation
- Create a `Procfile` in the root directory:
  ```text
  web: uvicorn backend.main:app --host 0.0.0.0 --port $PORT
  ```
- Ensure `requirements.txt` is up to date.
- Push your code to a GitHub repository.

### 2. Deployment Steps
1. Login to **Railway.app**.
2. Click **New Project** > **Deploy from GitHub repo**.
3. Add your **Environment Variables**:
   - `OPENAI_API_KEY` or `GEMINI_API_KEY`.
   - `DATASET_PATH=data/dataset.json`.
4. Railway will automatically detect the Python environment and the `Procfile`.

### 3. Handling Persistence (ChromaDB)
Since the vector store is saved in `chroma_store/`, adding a **Volume** in Railway ensures your data isn't wiped when the server restarts.
- Skip this for a hackathon if you just want it to work; the system will rebuild the index on startup if the directory is missing.

---

## 🌩 Alternative Path: Render.com (Free Tier Friendly)

Render is a great free alternative to Heroku.

1. Create a **Web Service** on Render.
2. Link your GitHub repository.
3. **Build Command**: `pip install -r requirements.txt`
4. **Start Command**: `uvicorn backend.main:app --host 0.0.0.0 --port $PORT`
5. Add your API Keys in the **Environment** tab.

---

## 🎨 Frontend Deployment (Vercel/Netlify)

If you want the fastest possible frontend loading, you can host the `frontend/` folder separately on **Vercel**:

1. Change the `BASE_URL` in your frontend `index.html` (or `script.js`) to point to your live Railway/Render backend URL.
2. Push only the `frontend/` folder to a new Vercel project.
3. **Benefit**: Instant loading and "Production-ready" URL for the UI.

---

## 🏗 Option D: AWS EC2 (The Enterprise Power Solution)
*Best for: 4GB+ projects, permanent professional hosting, and full infrastructure control.*

Deploying on AWS proves you can handle high-performance cloud infrastructure.

### 1. Provision an EC2 Instance
1. Go to the **AWS Console > EC2 > Launch Instance**.
2. **Name**: `EuroPlan-AI-Server`.
3. **AMI**: select `Ubuntu Server 22.04 LTS`.
4. **Instance Type**: Select **t3.large** (8GB RAM) or **t3.xlarge** (16GB RAM) to handle the 4GB index and LLM embeddings.
5. **Key Pair**: Create one and save the `.pem` file.
6. **Network Settings**:
   - Allow **HTTP (Port 80)**.
   - Allow **Port 8000** (Custom TCP) for the FastAPI backend.
   - Allow **Port 3000** (Custom TCP) for the Web UI.

### 2. Connect & Setup
Open your terminal and SSH into your instance:
```bash
ssh -i "your-key.pem" ubuntu@your-ec2-ip
```

Then run these setup commands:
```bash
# Update and install Docker
sudo apt update && sudo apt install docker.io docker-compose -y

# Clone your project
git clone https://github.com/your-username/europlan-ai.git
cd europlan-ai

# Build and run with Docker
sudo docker-compose up --build -d
```

### 3. Finalize Public URL
Your project is now live at: `http://your-ec2-ip:3000`.

---

## 📦 Final Production Checklist

- [ ] **Port Binding**: Ensure the backend listens on `0.0.0.0` and uses the `$PORT` environment variable.
- [ ] **API Keys**: Mask all keys using environment variables; never hardcode them!
- [ ] **CORS**: Ensure your backend allows requests from your frontend's live URL.
- [ ] **Memory**: The embedding model needs about **512MB to 1GB of RAM**. Choose a plan (like Railway's Pro or Render's Starter) that can handle the `sentence-transformers` load.

---

**Pro Tip for Graders**:
Providing a live link proves your "Last Mile" engineering capability and shows the project is more than just "local code on one laptop."
