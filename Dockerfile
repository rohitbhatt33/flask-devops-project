FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV APP_VERSION=1.0

EXPOSE 5000

CMD ["python", "app.py"]

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
CMD curl -f http://localhost:3000 || exit 1