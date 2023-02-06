FROM python:3.9-slim
COPY . /app
EXPOSE 80
WORKDIR /app
RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install -r app/requirements.txt
ENTRYPOINT ["streamlit", "run", "app/streamlit_app.py", "--server.port=80", "--server.address=0.0.0.0"]