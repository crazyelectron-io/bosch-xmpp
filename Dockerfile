# file: Dockerfile
# synopsis: Docker build file for Bosch XMPP server

FROM node:16-alpine

LABEL Maintainer="Ron Moerman <ron@crazyelectron.io>" \
      Description="Runs the Bosch XMPP HTTP server in a Docker container for easy deploying."

ENV BOSCH_XMPP_SERIAL_NUMBER=101592982
ENV BOSCH_XMPP_ACCESS_KEY=PmSEBPTd6c5rD4ap
ENV BOSCH_XMPP_PASSWORD=dyqjEt-0wahny-mytror
ENV BOSCH_PORT=3000
ENV BOSCH_IP=0.0.0.0

RUN npm install --global bosch-xmpp

EXPOSE $BOSCH_PORT

CMD bosch-xmpp easycontrol bridge $BOSCH_PORT $BOSCH_IP
