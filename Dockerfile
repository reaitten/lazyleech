FROM ubuntu:20.04

COPY run.sh requirements.txt testwatermark.jpg /app/
COPY lazyleech /app/lazyleech/
ARG DEBIAN_FRONTEND=noninteractive
RUN apt -y update && \
    apt install -y --no-install-recommends python3 git python3-pip ffmpeg aria2 file p7zip-full && \
    rm -rf /var/lib/apt/lists/* \
    && echo "Etc/UTC" > /etc/timezone \
    && pip3 install -r /app/requirements.txt
COPY . .
CMD ["bash","run.sh"]
