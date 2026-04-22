# EuroPlan AI: Project Concept & Implementation Summary

## 🌟 The Core Idea
**EuroPlan AI** is a "Research-Grade Multi-Agent Travel Reasoning System" designed to solve the common problem of AI "hallucination" in travel planning. Unlike basic chatbots, EuroPlan uses **Strict Grounding** and **Agentic Orchestration** to ensure that every hotel, attraction, and transport route mentioned exists in its verified internal dataset.

---

## 🏗 What We Built (The Implementation)

### 1. Multi-Agent Orchestration (LangGraph)
We didn't just use one prompt. We built a sophisticated **stateful pipeline** using LangGraph that routes requests through specialized agents:
- **Guardrail Agent**: Blocks non-European or malicious requests.
- **Memory Agent**: Tracks context (budget, duration, companions) across the chat.
- **Retrieval Agent**: Queries the Vector DB (ChromaDB) for factual data.
- **Constraint/Planning Agent**: Sequences activities to fit a logical daily schedule.
- **Budget Agent**: Performs real-time math to ensure the trip is affordable.
- **Persona Agent**: Wraps the raw data in a friendly, conversational brand voice.

### 2. The Data Core (RAG Stack)
- **Custom Vector Store**: Implemented a hybrid system using **ChromaDB** for persistent search and **NumPy** as a local fallback.
- **Embedding Pipeline**: Integrated `all-MiniLM-L6-v2` to process local JSON knowledge into searchable vectors.
- **Fidelity-First Logic**: Enforced a "Strict Mode" which causes the LLM to admit when it lacks data rather than making up locations.

### 3. Professional Frontend
- **Glassmorphism Design**: Created a modern, dark-themed UI with translucent panels and vibrant accent glows.
- **State Integration**: Balanced the conversational chat window with a "Justification" panel that shows the AI's internal reasoning.

### 4. Technical Hardening
- **Python Compatibility**: Fixed deep-level `pydantic v1` vs **Python 3.14** conflicts by pinning execution to a stable Anaconda Python 3.13 environment.
- **CORS & API Security**: Configured FastAPI middleware for seamless communication between the single-page frontend and the multi-agent backend.

---

## 🛠 Tech Stack Highlights
- **Backbone**: Python 3.13, FastAPI, Uvicorn.
- **AI Logic**: LangGraph, Sentence Transformers, Gemini/OpenAI (Multi-provider).
- **Database**: ChromaDB (Vector DB).
- **UI**: Vanilla HTML5, Modern CSS (Glassmorphism), JavaScript (Fetch/DOM).

---

## 🎯 Project Goal
The final result is a system that feels like a professional consumer app—reliable, visually stunning, and geographically accurate.
