1. The Idea  
If we are planning a trip, it means lots of work, such as booking hotels and knowing where to visit, and it all depends on our budget. For example, we can pre-decide and type things such as 5 days in Paris, a group of friends, €2000 budget, and it gives us a complete plan, such as which day to visit what place, what we can eat and what our would be our expense. 
 
2. The AI Part  
When AI is left alone, it behaves like a dumb device, which means it gives any nonsense response that makes no sense and has no authenticity. It might suggest a hotel that doesn't exist. So we will give it a good database like a guidebook to refer to ,and respond so that it doesn't make a mistake. This method is known as RAG; it checks first and then answers. We can trust AI blindly. It's like a fence around it. 

3. How It Is Built  
Think of it like a small team, each doing one job: 

LangGraph  : the manager, connects all steps in order 
ChromaDB : the memory, stores real travel facts so AI doesn't guess 
FastAPI : the engine, runs everything behind the scenes 
MiniLM embeddings : the translator, helps the AI understand what your words actually mean 
HTML/CSS/JS : the shop front, the website you actually type into 

The system also has two modes: free chat and a structured form where you pick up a budget and days. Both give you the same result: a real plan, not a guess. 
