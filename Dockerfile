FROM node:slim

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y python build-essential

RUN useradd --create-home --shell /bin/bash tera
USER tera

COPY --chown=tera ./tera/Source /tera
COPY --chown=tera ./scripts/* /tera/
WORKDIR /tera

RUN npm install

EXPOSE 8080
ENV PORT=8080
ENV PASSWORD=changeme

CMD [ "/tera/run-node.sh" ]