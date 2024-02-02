# file: Dockerfile
# synopsis: Docker build file for Bosch XMPP server

FROM node:16-alpine

LABEL Maintainer="Ron Moerman <ron@crazyelectron.io>" \
      Description="Runs the Bosch XMPP HTTP server in a Docker container for easy deploying."

ENV BOSCH_XMPP_SERIAL_NUMBER={{bosch_xmpp_serial}}
ENV BOSCH_XMPP_ACCESS_KEY={{bosch_xmpp_key}}
ENV BOSCH_XMPP_PASSWORD={{bosch_xmpp_password}}
ENV BOSCH_PORT=3000
ENV BOSCH_IP=0.0.0.0

RUN npm install --global bosch-xmpp

EXPOSE $BOSCH_PORT

CMD bosch-xmpp easycontrol bridge $BOSCH_PORT $BOSCH_IP
