# Base image
FROM nginx:alpine

# Delete default conf files
RUN rm /etc/nginx/conf.d/default.conf

# Copy files to the container
COPY ./conf.d/*.conf /etc/nginx/conf.d/
COPY ./public /usr/share/nginx/
COPY ./keys/*.pem /etc/ssl/certs/
COPY ./keys/*.key /etc/ssl/private/

# Default start command unmodified