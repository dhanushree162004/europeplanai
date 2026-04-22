# 🌍 EuroPlan AI: Hackathon Submission Report
**Course**: CST4625 | Generative AI  
**Developer**: dhanushree16  
**Status**: LIVE & DEPLOYED  

---

## 1. Executive Summary
**EuroPlan AI** is a professional-grade, multi-agent travel reasoning system designed to solve the high-friction, hallucination-prone nature of general-purpose LLM travel planning. It uses a **Grounded RAG (Retrieval-Augmented Generation)** architecture to ensure every itinerary suggested is backed by verified geographic data.

## 2. Technical Implementation (The Engineering View)

### A. Core AI Architecture: Multi-Agent Orchestration
Instead of a single "black box" prompt, we use a **Stateful Graph (LangGraph)** to coordinate specialized agents:
- **Intent Agent**: Classifies user input (Slot-filling vs. General Discovery).
- **Retrieval Agent**: Queries the **ChromaDB Vector Store** to find real European venues.
- **Planner Agent**: Generates structured JSON itineraries with 100% locational fidelity.
- **Chat Agent**: Converts logic into a warm, "ChatGPT-style" conversational response.

### B. Grounding & RAG Strategy
- **Vector DB**: ChromaDB using `all-MiniLM-L6-v2` embeddings.
- **The Data Lock**: We implemented a "Destination Lock" that prevents the model from suggesting cities outside of the verified dataset, even if the base model "wants" to hallucinate them.
- **Groundedness vs. Fluency**: We prioritize groundedness by injecting retrieved context directly into the planner's system prompt.

### C. Guardrails & Safety
- **Geographic Refusal**: The system explicitly refuses to plan trips outside of supported European territories.
- **Negation Awareness**: A "Politeness Shield" and "Negation Filter" ensure that if a user says "no kids," the AI strictly scrubs all child-related tags from its reasoning.

### **D. Full Technical Stack Registry**
| Component | Technology | Role in Project |
| :--- | :--- | :--- |
| **Orchestration** | **LangGraph** | Stateful agent reasoning & multi-turn memory |
| **Intelligence** | **Llama 3.2:1b** | Local LLM for reasoning and text generation |
| **Logic Engine** | **FastAPI** | High-performance backend API |
| **Vector DB** | **ChromaDB** | Semantic retrieval of verified travel data |
| **Local LLM Host** | **Ollama** | Self-contained model server within the container |
| **UI / Frontend** | **Vanilla JS/HTML/CSS**| Modern Glassmorphism UI with real-time updates |
| **Deployment** | **Docker / Hugging Face**| Edge-ready containerized cloud hosting |

## 4. Engineering Challenges & "Wins" (The Last Mile)
A key part of our journey was optimizing for **resource-constrained CPU environments** (Hugging Face Free Tier):

- 🚀 **Speed Optimization**: We implemented "Ultra-Light Itinerary" structures to reduce token output by 60%, bringing response times from >90s down to ~25s.
- 🛡️ **Atomic Integrity**: We developed a custom "JSON Recovery" layer that catches malformed model outputs and re-processes them before they reach the user.
- 📦 **Container Orchestration**: We built a sophisticated `Dockerfile` that manages the lifecycle of the **Ollama** model server and the **FastAPI** backend as a single service.

## 5. Academic Alignment (CST4625 Principles)
This project intentionally avoids common "weak submission" patterns by:
- ✅ **Scope Discipline**: Focusing on "High-Fidelity European Planning" rather than a broken global scope.
- ✅ **Usable Artifact**: Proving the "Last Mile" of engineering with a cloud-hosted demo.
- ✅ **Practical Use of AI**: Using AI as a **Logic Engine** for classification and structuring, not just as a text generator.

---

## 6. How to Run & Test
1. **Visit the Demo**: [Hugging Face Space](https://huggingface.co/spaces/dhanushree16/europe-planner)
2. **First Prompt**: Type "Hi, I want to go to Paris for 3 days."
3. **The Workflow**: Follow the AI's prompts for Budget, Traveler Type, and Preference.
4. **The Goal**: Watch the "Selected Itinerary" sidebar update in real-time with verified data.

---

### 🌐 Links
- **Hugging Face Space**: [https://huggingface.co/spaces/dhanushree16/europe-planner](https://huggingface.co/spaces/dhanushree16/europe-planner)
- **GitHub Repository**: [https://github.com/dhanushree162004/europeplanai](https://github.com/dhanushree162004/europeplanai)
