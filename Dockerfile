# Usar una imagen base de PHP
FROM php:8.0-fpm

# Instalar dependencias
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git

# Instalar extensiones de PHP necesarias para Laravel
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /var/www

# Copiar los archivos del proyecto al contenedor
COPY . .

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar dependencias de Laravel
RUN composer install

# Exponer el puerto
EXPOSE 9000

# Ejecutar PHP-FPM
CMD ["php-fpm"]
