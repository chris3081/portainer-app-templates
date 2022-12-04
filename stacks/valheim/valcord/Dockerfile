FROM python:3.9.15

RUN mkdir bot; \
    cd /bot; \
    git clone https://github.com/chris3081/valheim-discord-bot.git .; \
    cd code; \
    pip install -r requirements.txt

WORKDIR /bot/code
ENTRYPOINT [ "python3", "vdb_main.py" ]
