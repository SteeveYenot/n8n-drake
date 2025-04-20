FROM node:18-bullseye-slim

# Variables d'environnement pour N8N
ENV N8N_PORT=5680
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=adminpass

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libpoppler-cpp-dev \
    libtesseract-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Installer les paquets Python
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip && pip3 install -r /tmp/requirements.txt

# Installer N8N
RUN npm install --global n8n

EXPOSE 5680

# Lancer n8n
CMD ["n8n"]
