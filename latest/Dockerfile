FROM node:12 AS builder

WORKDIR /tmp

RUN curl -L -o imapapi.tar.gz https://github.com/andris9/imapapi/archive/v1.3.0.tar.gz && \
  tar -xzvf imapapi.tar.gz && \
  mv imapapi-1.3.0 app

WORKDIR /tmp/app

RUN npm install --production

FROM node:12-alpine

COPY entrypoint.sh /usr/local/sbin/entrypoint
RUN chmod +x /usr/local/sbin/entrypoint

COPY --from=builder /tmp/app /opt/app
WORKDIR /opt/app

EXPOSE 3000

ENV API_HOST="0.0.0.0" \
  API_PORT=3000 \
  LOG_LEVEL=trace \
  REDIS_DATABASE=0 \
  REDIS_HOST=redis \
  REDIS_PASSWORD="" \
  REDIS_PORT=6379 \
  REDIS_URL="" \
  REDIS_USERNAME=""


ENTRYPOINT [ "/usr/local/sbin/entrypoint" ]
