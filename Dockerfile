FROM alpine 
## file path to insepct 
#RUN mkdir /opt/demo
RUN  apk add --no-cache bash gawk sed grep bc coreutils
RUN mkdir /opt/demo
RUN addgroup -S demo && adduser -S demo -G demo
WORKDIR  /opt/demo
COPY demo.json /opt/demo
COPY entrypoint.sh /opt/demo
RUN chmod 775  -R /opt/demo
RUN chown demo:demo /opt/demo 
user demo

ENTRYPOINT  ["/bin/bash", "/opt/demo/entrypoint.sh"] 
