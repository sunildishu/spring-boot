# Use a base image with Java and Tomcat
FROM tomcat:9-jdk11



# Set working directory in the container
WORKDIR /usr/local/tomcat



# Remove default Tomcat webapps
RUN rm -rf webapps/*



# Copy the WAR file from your local machine into the container at /usr/local/tomcat/webapps
COPY ./target/demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/demo-0.0.1-SNAPSHOT.war



# Expose port 8080 to the outside world
EXPOSE 80



# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]

