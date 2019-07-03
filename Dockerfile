FROM alpine 
## file path to insepct 
RUN mkdir /opt/demo
RUN addgroup -S demo && adduser -S demo -G demo
WORKDIR  /opt/demo
COPY demo.json /opt/demo
COPY entrypoint.sh /opt/demo
RUN chmod 775  -R /opt/demo
user demo
ENTRYPOINT  ["sh", "/opt/demo/entrypoint.sh"] 
