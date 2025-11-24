FROM python:3.12-alpine

# Install dependencies required for pip packages
RUN apk update && \
    apk add --no-cache gcc musl-dev libffi-dev openssl-dev

WORKDIR /app

# Install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application
COPY . .

CMD ["python", "main.py"]
