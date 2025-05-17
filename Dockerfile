FROM python:3.10-alpine

WORKDIR /app

COPY . . 

RUN python -m venv /app/venv

RUN python -m venv ./.venv

COPY requirements.txt .

RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD [".venv/bin/unicorn", "spaceship.main:app", "-- host=0.0.0.0", "--port=8080"]
