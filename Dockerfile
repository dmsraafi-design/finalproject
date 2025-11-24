# Gunakan image resmi Python yang ringan
FROM python:3.12-slim

# Set environment
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DEFAULT_TIMEOUT=100

# Update OS dan install dependensi dasar
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, wheel agar lebih aman
RUN pip install --upgrade pip setuptools wheel

# Copy requirements
WORKDIR /app
COPY requirements.txt .

# Install dependencies dengan flag keamanan
RUN pip install --upgrade --require-hashes -r requirements.txt || \
    pip install --upgrade -r requirements.txt

# Copy source code
COPY . .

# Default command
CMD ["python", "main.py"]
