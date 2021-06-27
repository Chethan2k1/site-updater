FROM node:14-alpine AS BUILD_IMAGE

VOLUME ["/app"]
WORKDIR /app

COPY ./main.js /app/main.js
COPY ./package.json /app/package.json
COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./pull.sh /app/pull.sh

ENV GITHUB_CRED https://<github_username>:<github_password>@github.com

RUN chmod +x /app/entrypoint.sh;chmod +x /app/pull.sh

ENTRYPOINT [ "sh", "entrypoint.sh" ]

EXPOSE 8000/tcp
