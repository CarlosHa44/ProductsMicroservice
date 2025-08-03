# Etapa de construcción
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw clean package -DskipTests

# Etapa de ejecución (liviana)
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copiar solo el JAR desde la etapa anterior
COPY --from=build /app/target/products2-0.0.1-SNAPSHOT.jar app.jar

# Variables de entorno para MySQL (pueden sobrescribirse al ejecutar)
ENV DB_HOST=test-db \
    DB_PORT=3306 \
    DB_DATABASE=test \
    DB_USER=root \
    DB_PASSWORD=admin123

# Exponer el puerto por defecto de Spring Boot
EXPOSE 8080

# Ejecutar el JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
