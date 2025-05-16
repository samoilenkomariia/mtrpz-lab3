FROM python:3.10-bullseye

WORKDIR /app

RUN python -m venv ./.venv

COPY requirements.txt .

RUN . ./.venv/bin/activate && pip install --no-cache-dir -r requirements.txt

COPY . . 

EXPOSE 8080

CMD [".venv/bin/unicorn", "spaceship.main:app", "-- host=0.0.0.0", "--port=8080"]
