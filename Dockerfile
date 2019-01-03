FROM python:3.5-stretch
MAINTAINER Roberto Aguilar <r@rreboto.com>

COPY files/etc/apt/ /etc/apt/

# install base system
RUN apt-key add /etc/apt/keys/raspi.key && \
  apt-get update && \
  apt-get install -y python3-rpi.gpio && \
  pip3 install requests

# runtime setup
ARG VERSION
ENV DOCKER_RPI_GPIO_VERSION ${VERSION}

ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /usr/lib/python3/dist-packages

CMD ["python3"]
