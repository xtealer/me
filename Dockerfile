# Base image
FROM nginx:alpine

# Delete default conf files
RUN rm /etc/nginx/conf.d/default.conf

# Copy files to the container
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d/* /etc/nginx/conf.d/
COPY ./html/cv /usr/share/nginx/html/cv
COPY ./html/root /usr/share/nginx/html/root
COPY ./keys/*.pem /etc/ssl/certs/
COPY ./keys/*.key /etc/ssl/private/

# Default start command unmodified