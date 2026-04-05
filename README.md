# 🤖 Local AI RAG & Telegram Bot Orchestration

[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)](https://fastapi.tiangolo.com/)
[![Ollama](https://img.shields.io/badge/Ollama-000000?style=for-the-badge&logo=ollama&logoColor=white)](https://ollama.com/)
[![n8n](https://img.shields.io/badge/n8n-FF6D5A?style=for-the-badge&logo=n8n&logoColor=white)](https://n8n.io/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)

A powerful, **fully local** Retrieval-Augmented Generation (RAG) pipeline integrated with **Telegram**. This project leverages **FastAPI** for the backend, **FAISS** for vector search, **Ollama** for running LLMs locally, and **n8n** for seamless workflow orchestration.

---

## 🏗️ Architecture & Pipeline

The system is designed to provide privacy-first, offline-capable AI responses. It processes documents, stores them in a vector database, and retrieves them based on user queries via a Telegram bot.

![Local Q&A Pipeline](readme_images/WhatsApp%20Image%202026-04-05%20at%209.31.45%20PM.jpeg)

### Workflow breakdown:
1.  **User Message**: A user sends a query via Telegram.
2.  **n8n Orchestration**: n8n receives the webhook, processes the message, and forwards it to the FastAPI backend.
3.  **FastAPI Backend**: The core logic handles document ingestion and semantic search.
4.  **FAISS Search**: Performs an MMR (Maximal Marginal Relevance) search on the local vector store for relevant context.
5.  **Document Retrieval**: Pulls the most relevant chunks from the `rag-dataset`.
6.  **Ollama LLM**: Generates a refined response using local models (e.g., Qwen).

---

## 📱 User Interface (Telegram)

Experience the power of local AI directly on your phone. The bot provides instantaneous answers based strictly on your provided personal datasets.

![Telegram Bot Preview](readme_images/Screenshot%202026-04-06%20004642.png)

---

## 🚀 Key Features

-   **Privacy-First**: No data leaves your machine. All processing is done locally.
-   **Local Embeddings**: Uses `nomic-embed-text` via Ollama for high-quality semantic understanding.
-   **Fast Vector Search**: FAISS index ensures millisecond retrieval even with large datasets.
-   **Scalable Orchestration**: n8n allows for easy expansion (e.g., adding Email, Discord, or Slack integrations).
-   **Docker Ready**: Entire stack is containerized for one-click deployment.

---

## 🛠️ Tech Stack

-   **Backend**: Python, FastAPI
-   **RAG Framework**: LangChain
-   **Vector Database**: FAISS
-   **LLM Provider**: Ollama ([Qwen 3.5 0.8B](https://ollama.com/llm/qwen3.5:0.8b) & [nomic-embed-text](https://ollama.com/library/nomic-embed-text))
-   **Orchestration**: n8n
-   **Tunnelling**: ngrok (for Telegram webhooks)
-   **Deployment**: Docker & Docker Compose

---

## 📥 Getting Started

### 1. Prerequisites
-   Docker and Docker Compose installed.
-   An [ngrok](https://ngrok.com/) account for webhooks.
-   A Telegram Bot Token (from [@BotFather](https://t.me/botfather)).

### 2. Environment Setup
Create a `.env` file in the root directory:
```env
NGROK_DOMAIN=your-static-domain.ngrok-free.app
NGROK_AUTHTOKEN=your_ngrok_token
```

### 3. Deploy the Stack
```bash
docker-compose up -d
```

### 4. Pull Required Models & Ingest Data
Inside the Ollama container:
```bash
docker exec -it ollama ollama pull qwen3.5:0.8b
docker exec -it ollama ollama pull nomic-embed-text
```

Then, trigger the document ingestion:
```bash
docker exec -it python-api python main.py
```
*(This processes all PDFs in the `rag-dataset` folder and creates the FAISS index.)*

---

## 📂 Project Structure

```text
├── main.py              # FastAPI Backend & RAG Logic
├── rag-dataset/         # Place your PDF documents here
├── n8n/
│   └── workflows/       # n8n JSON workflow exports
├── readme_images/       # Visual assets
├── Dockerfile           # Backend containerization
└── docker-compose.yaml  # Multi-container orchestration
```

---

## 🤝 Contributing
Feel free to fork this repository, open issues, and submit PRs for any improvements or new feature integrations!

---
*Created with ❤️ for local AI enthusiasts.*
