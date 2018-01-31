# Extend from Alpine open-jdk
FROM jetty:9.4.7-jre8-alpine 

USER root
# Set Maintainer
LABEL authors="Vernon Chapman <g8tor692@gmail.com>"

ENV WEBAPPS /var/lib/jetty/webapps 
ENV DATA_DIR /data/webprotege
ENV webprotege.data.directory ${DATA_DIR}
ENV webprotege.application.host localhost

ENV PROTEGE_NAME protege 
ENV PROTEGE_VERSION 2.6.0 
ENV PROTEGE_URL https://github.com/protegeproject/webprotege/releases/download/v${PROTEGE_VERSION}/webprotege-${PROTEGE_VERSION}.war


RUN wget -O ${WEBAPPS}/${PROTEGE_NAME}.war $PROTEGE_URL && \
    mkdir -p ${DATA_DIR}
    
RUN chown -R jetty:jetty ${WEBAPPS} ${DATA_DIR}


VOLUME [$DATA_DIR]

USER jetty
