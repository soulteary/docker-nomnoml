FROM soulteary/nomnoml:1.3.1

RUN curl -L https://raw.githubusercontent.com/soulteary/graphre/webpack-es5/dist/graphre.es5.js -O graphre.js && \
    curl -L https://raw.githubusercontent.com/soulteary/nomnoml/njs-es5/dist/nomnoml.es5.js -O nomnoml.js && \
    curl -L https://raw.githubusercontent.com/soulteary/docker-nomnoml/main/src/api.js -O api.js && \
    cat graphre.js nomnoml.js api.js > /etc/nginx/image.js && rm *.js

COPY nginx.conf /etc/nginx/nginx.conf
