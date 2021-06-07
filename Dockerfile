FROM adoptopenjdk/openjdk11:latest
ADD build/libs/microservice1-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]
