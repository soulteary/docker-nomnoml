FROM node:15.5.1-alpine3.12 AS Builder
ENV NOMNOML_VERSION 1.3.1
RUN apk add bash
WORKDIR /app
SHELL ["/bin/bash", "-c"]
RUN wget https://github.com/skanaar/nomnoml/archive/v${NOMNOML_VERSION}.tar.gz -O ${NOMNOML_VERSION}.tar.gz && \
    tar zxvf ${NOMNOML_VERSION}.tar.gz && rm -rf ${NOMNOML_VERSION}.tar.gz && \
    cd nomnoml-${NOMNOML_VERSION} && npm install && npm run build
RUN mkdir -p /app/njs/ && cd /app/njs/ && \
    wget https://raw.githubusercontent.com/soulteary/graphre/webpack-es5/dist/graphre.es5.js -O graphre.js && \
    wget https://raw.githubusercontent.com/soulteary/nomnoml/njs-es5/dist/nomnoml.es5.js -O nomnoml.js && \
    wget https://raw.githubusercontent.com/soulteary/docker-nomnoml/main/src/api.js -O api.js && \
    cat graphre.js nomnoml.js api.js > image.js && \
    wget https://raw.githubusercontent.com/soulteary/docker-nomnoml/main/nginx.conf -O nginx.conf

FROM nginx:1.19.6-alpine
ENV NOMNOML_VERSION 1.3.1
RUN rm -rf /usr/share/nginx/html/*
WORKDIR /usr/share/nginx/html
COPY --from=Builder /app/nomnoml-${NOMNOML_VERSION}/dist/        ./dist/
COPY --from=Builder /app/nomnoml-${NOMNOML_VERSION}/codemirror/  ./codemirror/
COPY --from=Builder /app/nomnoml-${NOMNOML_VERSION}/img/         ./img/
COPY --from=Builder /app/nomnoml-${NOMNOML_VERSION}/index.html   .
COPY --from=Builder /app/nomnoml-${NOMNOML_VERSION}/nomnoml.css  .
COPY --from=Builder /app/nomnoml-${NOMNOML_VERSION}/favicon.png  .
RUN touch additionals.js
COPY --from=Builder /app/njs/image.js   /etc/nginx/image.js
COPY --from=Builder /app/njs/nginx.conf /etc/nginx/nginx.conf
