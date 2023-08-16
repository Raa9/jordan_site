# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Update the package repositories and install NGINX
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the HTML file and the 'styles' directory into the container's web root directory
COPY index.html /var/www/html
COPY styles /var/www/html/styles

# Expose port 80 for the NGINX web server
EXPOSE 80 

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
