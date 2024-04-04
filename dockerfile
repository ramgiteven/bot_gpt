FROM python:3.10.12
WORKDIR /
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Separate COPY command
COPY . .

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app"]
