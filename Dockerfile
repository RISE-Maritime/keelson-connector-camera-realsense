FROM python:3.11-slim-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libusb-1.0-0 \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY . .

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

ENTRYPOINT ["python", "bin/main.py"]