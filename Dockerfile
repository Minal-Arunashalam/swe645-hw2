FROM tomcat:9.0-jdk15
COPY target/StudentSurvey-1.0.war /usr/local/tomcat/webapps/StudentSurvey.war