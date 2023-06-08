From openjdk:17-oracle

ARG JAR_FILE=build/libs/githubactiondemo.jar

ADD ${JAR_FILE} githubactiondemo.jar

ENTRYPOINT ["java","-jar","/githubactiondemo.jar"]