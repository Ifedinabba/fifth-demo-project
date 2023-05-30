# Build a WAR File
FROM maven:3.8.2-jdk-8-slim AS stage1
WORKDIR /mnt/c/Users/Ifedi/projects/fifth-demo-project
COPY . /mnt/c/Users/Ifedi/projects/fifth-demo-project
RUN mvn -f /mnt/c/Users/Ifedi/projects/fifth-demo-project/pom.xml clean package

# Create an Image
FROM openjdk:8-jdk-alpine
EXPOSE 6000
COPY --from=stage1 /mnt/c/Users/Ifedi/projects/fifth-demo-project/target/webapps/fifth-demo-project.war fifth-demo-project.war
ENTRYPOINT ["sh", "-c", "java -jar /fifth-demo-project.war"]
