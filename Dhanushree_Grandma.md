## Introduction

When making plans for a trip, we always find ourselves opening many websites but still feel confused about everything. Our website is an Intelligent Europe Trip Planner. We only have to provide with the data like “4 days in Paris with 5000 budget and family,” and it will create the entire travel plan for us on daily basis. It will tell us what to do from morning until night and also where we can visit and rest, along with hotel and food suggestions.

---

## Artificial Intelligence in the System

This is because Artificial Intelligence is used in the system, so our inputs are read and reply like humans. But AI sometimes goes wrong or make-up answers. To avoid that, the system checks a collection of travel data before giving the plan, so whatever it shows is based on real places and not just guesses.

---

## How the System Works

Imagine that there are some special helpers here with different helpers with their own tasks. First, there will be one which does all the work behind the scenes (Python, FastAPI), then there is an AI helper which understands your message and generates the entire plan. There is another one helper who stores actual travel information (ChromaDB), there is another one looks into the stored data and then builds the plan from it (RAG), and also there is another one which monitors our requests like how much money we want to spend, how many days of travelling, and many more (LangGraph). There is also a translator (Embeddings- MiniLM). Lastly, there is the website itself (HTML, CSS, JavaScript). Basically, it looks like a set of people where one understands what we ask about, one checks whether there is such information, one manages all these processes, and one displays it to us.

---

## What the User Sees

When we open the website, it seems like we can talk with someone. We can write our wishes about the vacation, and it gives us an answer. There will also be a page which shows the entire plan with Day 1, Day 2, and so on with morning activity, afternoon activity, and evening activity with suggested meals and hotels.

---

## Deployment

This does not just work on our computer, but it works for everyone. We can just open our mobile/computer and open it in a browser like any other website and use it.
