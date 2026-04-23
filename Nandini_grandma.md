# EuroPlan AI — Project Overview 

## 1. The Idea

Planning a trip involves a lot of work - booking hotels, finding places to visit,
and staying within a budget. This project removes that effort.

You type something like: "5 days in Paris, group of friends, €2000 budget"
and it builds a complete plan for you - which place to visit each day,
what to eat, and what your expenses will look like.

---

## 2. The AI Part

When AI is left alone, it can produce responses that sound confident but are
completely made up. It might suggest a hotel that does not exist.

To fix this, the AI is given a real knowledge base to refer to before it answers —
like a guidebook before an exam. It can only respond using facts from that source.
This method is called RAG (Retrieval-Augmented Generation): check first, then answer.
The AI is not trusted blindly. There is a fence around it.

---

## 3. How It Is Built

The system works like a small team, where each part does one specific job:

| Component         | Role                                                   |
|-------------------|--------------------------------------------------------|
| LangGraph         | The manager - connects all steps in order              |
| ChromaDB          | The memory - stores real travel facts so AI does not guess |
| FastAPI           | The engine - runs everything behind the scenes         |
| MiniLM Embeddings | The translator - helps AI understand what your words mean |
| HTML / CSS / JS   | The front end - the website you actually type into     |

The system has two modes: a free chat where you type naturally, and a structured
form where you select budget, number of days, and trip type. Both produce the
same output - a real day-by-day plan, not a guess.
