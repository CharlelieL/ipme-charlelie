# Use the specified image as the base
FROM chialab/php:8.2-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY . /var/www/html

# Copy Apache configuration file
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Install Composer dependencies
RUN composer install --no-dev --optimize-autoloader

# Change ownership of the storage and bootstrap/cache directories
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 80
EXPOSE 80

# Start Apache server in the foreground haha
CMD ["apache2-foreground"]

