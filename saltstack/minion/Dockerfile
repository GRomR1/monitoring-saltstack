FROM debian:12-slim

ARG SALT_VERSION="3006.7"
ARG ARCH="arm64"

ADD https://packages.broadcom.com/artifactory/saltproject-deb/pool/salt-common_${SALT_VERSION}_${ARCH}.deb /tmp/
ADD https://packages.broadcom.com/artifactory/saltproject-deb/pool/salt-minion_${SALT_VERSION}_${ARCH}.deb /tmp/

RUN apt-get update && \
  apt-get install -y curl && \
  apt-get install -y /tmp/salt-*.deb && \
  apt-get clean && \
  rm -rf /tmp/*.deb

ENTRYPOINT []
CMD ["/bin/salt-minion"]
