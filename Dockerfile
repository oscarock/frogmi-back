# Utiliza la imagen base de Ruby Alpine
FROM ruby:3.3.0-alpine

# Instala dependencias del sistema operativo necesarias para compilar gemas
RUN apk add --update --no-cache \
    build-base \
    mysql-dev \
    nodejs \
    yarn

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Actualizar RubyGems
RUN gem update --system

# Instalar Bundler
RUN gem install bundler

# Copia el Gemfile y el Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala las gemas del proyecto
RUN bundle install

# Copia el resto de los archivos de la aplicación al contenedor
COPY . .

# Expone el puerto 3000, que es el puerto por defecto de Rails
EXPOSE 3000

# Define el comando por defecto para ejecutar la aplicación cuando el contenedor se inicia
CMD ["rails", "server", "-b", "0.0.0.0"]
