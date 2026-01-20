# Baza: lekki Python
FROM python:3.9-slim

# Katalog roboczy w kontenerze
WORKDIR /app

# Kopiujemy pliki
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Informacja o porcie (dokumentacyjna)
EXPOSE 8000

# Komenda startowa
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]