FROM lolhens/baseimage-openjre
COPY ./target/demo-0.0.1-SNAPSHOT.war demo-0.0.1-SNAPSHOT.war
EXPOSE 80
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.war"]
