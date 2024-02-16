FROM openjdk:11-jdk-slim
WORKDIR /app
COPY ./target/demo-0.0.1-SNAPSHOT.war /app/demo-0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.war"]
