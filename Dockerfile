FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /var/www/html

# Update the package repositories and install NGINX
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the HTML file and the 'styles.css' file into the container's web root directory
COPY index.html /var/www/html
COPY css /var/www/html/
COPY style.css /var/www/html/
COPY My_project.png /var/www/html/
COPY pngwing.com.png /var/www/html/

# Expose port 80 for the NGINX web server
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

