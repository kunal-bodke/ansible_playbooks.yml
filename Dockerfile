FROM ubuntu:latest
LABEL version="1.0"
LABEL description="this is an Application Image"
RUN apt update -y
RUN apt install apache2 -y
RUN service apache2 start
ENV package1=git
RUN apt install $package1 -y
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz /.
COPY ./script.sh /.
COPY ./index.html /var/www/html
RUN service apache2 restart
EXPOSE 80
RUN mkdir application_backup
RUN echo "main data has been hidden for the safety" > /application_backup/lock
VOLUME /application_backup
RUN useradd -ms /bin/bash skoda
