# ----------------------------------------------------------------------
# | Config file for example.com host                                   |
# ----------------------------------------------------------------------
#
# This file is a template for an Nginx server.
# This Nginx server listens for the `example.com` host and handles requests.
# Replace `example.com` with your hostname before enabling

server {
  listen 80;
  
  # The host name to respond to
  server_name hakvit.com;

  #include h5bp/tls/ssl_engine.conf;
  #include h5bp/tls/certificate_files.conf;
  #include h5bp/tls/policy_balanced.conf;

  # Path for static files
  root /var/www;
  index index.php;

  # Custom error pages
  include h5bp/errors/custom_errors.conf;

  location / {
    try_files $uri $uri/ /index.php?$query_string;
  }

  # Include the basic h5bp config set
  include h5bp/basic.conf;

  include php-fpm.conf;
}