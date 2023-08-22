FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /portfolio

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Install Apache web server and necessary modules using apk
RUN apk update && apk add apache2 apache2-proxy

# Enable necessary Apache modules
RUN sed -i '/LoadModule proxy_module/s/^#//g' /etc/apache2/httpd.conf
RUN sed -i '/LoadModule proxy_http_module/s/^#//g' /etc/apache2/httpd.conf
RUN sed -i '/LoadModule proxy_balancer_module/s/^#//g' /etc/apache2/httpd.conf
RUN sed -i '/LoadModule lbmethod_byrequests_module/s/^#//g' /etc/apache2/httpd.conf

# Set up Apache configuration with access and error logs and ProxyPass
RUN echo "<VirtualHost *:80>\n\
  ServerName www.maheshkaldhone.online\n\
  DocumentRoot /tmp/portfolio\n\
\n\
  # Configure access logs
  CustomLog /var/log/apache2/access.log combined\n\
  ErrorLog /var/log/apache2/error.log\n\
\n\
  ProxyPass / http://localhost:3000/\n\
  ProxyPassReverse / http://localhost:3000/\n\
</VirtualHost>" > /etc/apache2/conf.d/000-default.conf

EXPOSE 80
CMD httpd -D FOREGROUND && npm start
