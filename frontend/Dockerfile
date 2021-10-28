# Multi-Stage Web App Image building

# App version
ARG VERSION=1.0.0

# Lib and Tools version [28.10.2021]
ARG FLUTTER_VERSION=2.5.3 
ARG NGINX_VERSION=1.21.3-alpine

# Integrations
ARG BACKEND_HOST=localhost
ARG BACKEND_PORT=80

###############################################
# Build application
FROM cirrusci/flutter:$FLUTTER_VERSION AS app-builder
ARG VERSION
ENV VERSION $VERSION

WORKDIR /app
COPY . /app
#RUN npm install \
#    && npm run-script build

###############################################
# Copy app from app-builder and run
FROM nginx:$NGINX_VERSION AS runtime
ARG BACKEND_HOST
ARG BACKEND_PORT
ENV BACKEND_HOST $BACKEND_HOST
ENV BACKEND_PORT $BACKEND_PORT

COPY --from=app-builder /app/dist/* /usr/share/nginx/html/
COPY default.conf /default.conf
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN ["chmod", "+x", "/usr/local/bin/docker-entrypoint.sh"]
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]