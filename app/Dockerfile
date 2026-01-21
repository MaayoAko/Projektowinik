FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN groupadd -r appuser && useradd -r -g appuser appuser
USER appuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

HEALTHCHECK --interval=30s --timeout=3s \
  CMD python -c 'import http.client; \
  conn = http.client.HTTPConnection("localhost", 8000); \
  conn.request("GET", "/health"); \
  res = conn.getresponse(); \
  exit(0) if res.status == 200 else exit(1