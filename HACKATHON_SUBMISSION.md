# 🌍 EuroPlan AI: Multi-Agent Travel Reasoning System

## 🌟 Project Overview
**EuroPlan AI** is an advanced, multi-agent travel assistant designed to deliver high-fidelity, geographically grounded itineraries. By leveraging a stateful agentic architecture and Retrieval-Augmented Generation (RAG), the system ensures every attraction and trip detail is verified against an internal truth-source, offering a seamless and professional planning experience.

---

## 🎯 Problem Statement
Most AI travel planners suffer from "Hallucination Loop"—suggesting places that don't exist, restaurants that are permanently closed, or geographically impossible routes. **EuroPlan AI** solves this by implementing **Strict Semantic Grounding**, where every suggestion is cross-referenced with a curated vector database before being presented to the user.

---

## 🏗 System Architecture

The system utilizes **LangGraph** to orchestrate a distributed pipeline of specialized AI agents:

1.  **Guardrail Agent**: Filters requests to ensure they remain within the European domain and comply with safety standards.
2.  **Memory Agent**: Manages state across the conversation, tracking user preferences for budget, duration, and group type.
3.  **Retrieval Agent**: Queries a **ChromaDB Vector Store** to find high-relevance, factual context for the specific destination.
4.  **Planner Agent**: Generates a structured Day-by-Day itinerary optimized for logical pacing and variety.
5.  **Vibe Engine**: An intelligent classification layer that tailors the trip's "atmosphere" (Romantic, Adventurous, or Family) based on the traveler profile.

---

## 🚀 Innovative Features

- **Self-Hosted Intelligence (Privacy First)**: The project is optimized for **Local LLMs (e.g., Llama 3.2 via Ollama)**. This ensures that sensitive traveler data never leaves the local environment, satisfying strict industry privacy standards.
- **Strict Semantic Grounding**: The system is programmatically incapable of hallucinating destinations. If a city is not in the verified dataset, the agent provides a polite refusal rather than a false plan.
- **Glassmorphism UI**: A high-end, responsive dark-mode interface that visualizes real-time itinerary updates and budget breakdowns in an interactive sidebar.

---

## 🧪 Technical Stack

- **Framework**: Python 3.13 / FastAPI.
- **Orchestration**: LangGraph (Stateful Workflows).
- **Database**: ChromaDB (Vector Search).
- **Embeddings**: `all-MiniLM-L6-v2`.
- **Frontend**: Vanilla HTML5, CSS3 (Modern Glassmorphism), and JavaScript.

---

## 🎓 Grading Alignment Checklist

| Hackathon Criterion | Project Implementation |
| :--- | :--- |
| **A. Clear Problem** | Solves AI hallucination in travel using a verified data backbone. |
| **B. Scope Discipline** | Delivered a high-fidelity prototype focused on 8 core European nations. |
| **C. Sensible use of AI** | Uses AI for RAG-based context, intent-mapping, and day-by-day sequencing. |
| **D. Course Integration** | Incorporates Grounding, Domain Guardrails, and Prompt Constraints. |
| **E. Usable Artifact** | A complete, testable Full-Stack application with a professional UI. |

---

## 🏃‍♂️ How to Run

1.  **Environment**: Ensure Python 3.13 is installed.
2.  **Install Dependencies**: `pip install -r requirements.txt`
3.  **Launch Backend**: `uvicorn backend.main:app --reload`
4.  **Launch Frontend**: Open `frontend/index.html` in your browser.

---

**EuroPlan AI — Precision Planning for the Modern Traveler.**
