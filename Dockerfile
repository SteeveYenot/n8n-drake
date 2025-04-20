FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y 
    tesseract-ocr 
    poppler-utils 
    python3-pip 
    python3-dev 
    build-essential 
    libpoppler-cpp-dev 
    libtesseract-dev 
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt

USER node
