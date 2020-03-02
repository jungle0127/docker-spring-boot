FROM centos:7
LABEL maintainer="PS <arbor@foxmail.com>"

COPY docker/jre/jre-8u201-linux-x64.tar.gz /home

RUN set -x \
    && tar -zxvf /home/jre-8u201-linux-x64.tar.gz -C /usr/local \
    && rm -f /home/jre-8u201-linux-x64.tar.gz
ENV JAVA_HOME="/usr/local/jre1.8.0_201"
ENV PATH $PATH:$JAVA_HOME/bin

COPY target/docker-springboot.jar /usr/local
ENTRYPOINT ["java", "-jar", "/usr/local/docker-springboot.jar"]


