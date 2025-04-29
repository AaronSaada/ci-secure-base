FROM python:3.11-alpine

WORKDIR /app

RUN apk update && apk upgrade

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 3000 
CMD ["python", "app.py"]
