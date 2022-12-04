FROM python:latest

WORKDIR /bot

RUN git clone https://github.com/chris3081/valheim-discord-bot.git . \
    cd code; \
    pip install -r requirements.txt

WORKDIR /bot/code
ENTRYPOINT ['python', 'vdb_main.py']