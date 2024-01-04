FROM ubuntu:24.04

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y aspnetcore-runtime-8.0
RUN mkdir config
RUN wget https://github.com/romslf/Ultimate-Proxy/releases/download/2.2.1.6/UltimateProxy-v2.2.1.6-linux-x64.zip
RUN unzip UltimateProxy-v2.2.1.6-linux-x64.zip -d .
RUN chmod +x UltimateProxyV2
RUN cp config.json ./config/config.json
RUN cp -r Config*Examples/ ./config/
RUN rm -r Config*Examples
RUN rm config.json
RUN rm UltimateProxy-v2.2.1.6-linux-x64.zip
EXPOSE 4444

ENTRYPOINT ["./UltimateProxyV2","./config/config.json"]
