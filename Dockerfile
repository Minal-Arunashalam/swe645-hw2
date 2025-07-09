# Name: Minal Arunashalam
# Dockerfile for hw2, pulls Tomcat 9.0 with JDK 15 and copies the project's WAR file into the Tomcat webapps directory.
FROM tomcat:9.0-jdk15
COPY target/StudentSurvey-1.0.war /usr/local/tomcat/webapps/StudentSurvey.war