
# Pasos para ejecutar el proyecto

1 - Clonar el repositorio

2 - Dentro de la carpeta del repositorio ejecutar el comando para crear la imagen 
```bash
docker compose build
``` 
3 - Ejecutar el siguiente comando para levantar el proyecto
```bash
docker compose up 
``` 
4 - Ejecutar el siguiente comando para obntener el id del contenedor y verificar q esten en UP los contenedores son 2 
```bash
docker ps -a
``` 
5 - Ejecutar el siguiente comando para ingresar al contenedor 
```bash
docker exec -it <container-id> sh
``` 
6 - Ejecutar el siguiente comando para crear la base de datos
```bash
rails db:create
``` 
7 - Ejecutar el siguiente comando para crear las migraciones
```bash
rails db:migrate
``` 
7 - Ejecutar el siguiente comando para correr el task

**NOTA:** Esto puede tardar unos minutos. En la consola avisara cuando termine de persistir los datos en la BD
```bash
rake feature:get_data
```  

8 - Una vez hechos todos los pasos ya el proyecto debe funcionar 

9 - Clonar el repositorio del front y ejecutar 
```bash
npm run dev
```  

## Requisitos

- ruby >= versión 3.3.0
- ruby on rails >= 7.1.3.2

## Autor

- Este proyecto fue creado por **Oscar Diaz**.

## Contacto

Para cualquier pregunta o comentario, no dudes en ponerte en contacto conmigo [github](https://github.com/oscarock)
