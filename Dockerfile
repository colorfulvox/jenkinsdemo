From openjdk:17-oracle

ARG JAR_FILE=build/libs/jenkinsdemo.jar

ADD ${JAR_FILE} jenkinsdemo.jar

ENTRYPOINT ["java","-jar","/jenkinsdemo.jar"]