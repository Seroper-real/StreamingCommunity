FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    screen \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Rimuove config.json se esiste
RUN rm -f config.json
# Rinomina config-docker.json in config.json
RUN mv config-docker.json config.json

RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]
CMD ["script"]