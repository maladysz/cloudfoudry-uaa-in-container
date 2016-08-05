FROM tap-base-java:java8-jessie

WORKDIR /root
RUN mkdir tmp
ADD http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz tmp/
RUN tar -xf tmp/apache-tomcat-7.0.55.tar.gz && \
    rm -rf tmp
COPY tomcatconfig/* apache-tomcat-7.0.55/conf/
COPY target/uaa/uaa/build/libs/cloudfoundry-identity-uaa-3.2.1.war apache-tomcat-7.0.55/webapps/

EXPOSE 8080
CMD apache-tomcat-7.0.55/bin/catalina.sh run
