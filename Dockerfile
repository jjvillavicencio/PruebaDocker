FROM java:7
COPY . /usr/src/PruebaDocker
WORKDIR /usr/src/PruebaDocker
RUN javac src/pruebadocker/Main.java
CMD ["java", "Main"]
