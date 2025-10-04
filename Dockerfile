# Use official Kali Linux base image
FROM kalilinux/kali-rolling

# Update package lists and install apache2
RUN apt update -y && apt install -y apache2

# Copy your website file into the Apache default directory
COPY index.html /var/www/html/

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
