FROM python:3.11-alpine

WORKDIR /app

COPY FinalProject/requirements.txt .

RUN pip install -r requirements.txt

COPY FinalProject/ .

EXPOSE 5000

CMD ["python", "app.py"]
