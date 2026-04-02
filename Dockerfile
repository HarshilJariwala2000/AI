FROM python:3.13-slim

# Install system dependencies for FAISS and PyMuPDF
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglx-mesa0 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
# COPY pyproject.toml .
# COPY poetry.lock .
RUN pip install -r requirements.txt

COPY . .

# Expose the port FastAPI runs on
EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]