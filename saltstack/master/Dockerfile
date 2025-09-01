FROM debian:12-slim

ARG SALT_VERSION="3006.7"
ARG SALT_EXPORTER_VERSION="0.11.2"
ARG SALT_API_USERNAME="salt_api"
ARG SALT_API_PASSWORD="123"
ARG ARCH="arm64"

ADD https://packages.broadcom.com/artifactory/saltproject-deb/pool/salt-common_${SALT_VERSION}_${ARCH}.deb /tmp/
ADD https://packages.broadcom.com/artifactory/saltproject-deb/pool/salt-ssh_${SALT_VERSION}_${ARCH}.deb /tmp/
ADD https://packages.broadcom.com/artifactory/saltproject-deb/pool/salt-api_${SALT_VERSION}_${ARCH}.deb /tmp/
ADD https://packages.broadcom.com/artifactory/saltproject-deb/pool/salt-master_${SALT_VERSION}_${ARCH}.deb /tmp/
ADD https://github.com/kpetremann/salt-exporter/releases/download/v${SALT_EXPORTER_VERSION}/salt-exporter_${SALT_EXPORTER_VERSION}_Linux_${ARCH}.tar.gz /tmp/

WORKDIR /tmp
RUN apt-get update && \
  apt-get install -y supervisor curl procps && \
  apt-get install -y /tmp/salt-*.deb && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean && \
  tar -xvf salt-exporter_${SALT_EXPORTER_VERSION}_Linux_${ARCH}.tar.gz && \
  cp salt-exporter /bin/ && touch /etc/salt/salt-exporter.yml && \
  rm -rf /tmp/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN useradd -M -r -s /bin/false ${SALT_API_USERNAME} && echo ${SALT_API_USERNAME}:${SALT_API_PASSWORD} | chpasswd

WORKDIR /
EXPOSE 2112 8000
ENTRYPOINT []
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
