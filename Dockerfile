FROM openjdk:17
COPY quotes  /usr/src/quote-api/quotes
COPY  target/backend-1.0-SNAPSHOT-jar-with-dependencies.jar /usr/src/quote-api/backend.jar 
WORKDIR /usr/src/quote-api/
ENTRYPOINT java -jar backend.jar 
