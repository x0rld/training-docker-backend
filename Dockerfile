FROM maven:3.8.5-openjdk-17-slim as build
COPY . /usr/src/java
WORKDIR /usr/src/java
RUN mvn clean install 

FROM openjdk:17
COPY quotes  /usr/src/quote-api/quotes
COPY --from=build /usr/src/java/target/backend-1.0-SNAPSHOT-jar-with-dependencies.jar /usr/src/quote-api/backend.jar 
WORKDIR /usr/src/quote-api/
ENTRYPOINT java -jar backend.jar 
