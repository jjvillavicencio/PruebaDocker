# Docker con Java en Ubuntu 16.04 LTS


* * *
Por: John J Villavicencio S.

* * *

## Instalación
### 1. Instalar https, y certificados CA.
```
$ sudo apt-get update
$ sudo apt-get install apt-transport-https ca-certificates
```
![Imgur](http://i.imgur.com/HzWFwR6.png)

### 2. Agregar GPG key.

```
$ sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```
![Imgur](http://i.imgur.com/ZckFSTM.png)

### 3. Agregar proveedor de paquetes.

```
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
```
![Imgur](http://i.imgur.com/097aXse.png)

### 4. Agregar paquetes de kernel extra.

```
$ sudo apt-get update
$ sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
```
![Imgur](http://i.imgur.com/MXxPpGD.png)

### 5. Instalar Docker

```
$ sudo apt-get update
$ sudo apt-get install docker-engine
```
![Imgur](http://i.imgur.com/OKw5pgh.png)


- - -
 ## Ejecución
 ### 1. Ejecutar `docker` daemon
 ```
$ sudo service docker start
```
![Imgur](http://i.imgur.com/3T1UnDn.png)

### 2. Instalar java en docker
```
$ sudo docker pull java 
```
![Imgur](http://i.imgur.com/FLd53v2.png)

### 3. Crear archivo `Dockerfile` en la raiz del proyecto

```
$ nano Dockerfile
```
con el siguiente contenido:
```
FROM java:7
#Lugar a donde se va copiar el proyecto
COPY . /usr/src/PruebaDocker
#Establecer el directorio de trabajo
WORKDIR /usr/src/PruebaDocker
#Ejecutar el `Main` del proyecto
RUN javac src/pruebadocker/Main.java
CMD ["java", "Main"]
```
### 4. Crear la imagen docker
```
$ sudo docker build -t my-java-app .
```
![Imgur](http://i.imgur.com/v5QzZlT.png)

### 5. Ejecutar la imagen docker

```
$ sudo docker run -it --rm --name my-running-app my-java-app
```
![Imgur](http://i.imgur.com/mwET6An.png)
![Imgur](http://i.imgur.com/UmHyxPx.png)