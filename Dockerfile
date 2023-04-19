FROM openjdk:8-jdk-slim
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y wget gnupg2 unzip
RUN wget https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
EXPOSE 4444
CMD java -jar selenium-server-standalone-3.141.59.jar -role hub -port 4444

