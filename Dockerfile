FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    tesseract-ocr \
    poppler-utils \
    python3-pip \
    python3-dev \
    build-base \
    libpoppler \
    libtesseract \
    && pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

EXPOSE 5680

USER node
