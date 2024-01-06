FROM ubuntu:24.04

RUN apt-get update && \
   apt-get -y upgrade && \
   apt-get install -y wget unzip aspnetcore-runtime-8.0 && \
   apt-get clean

RUN mkdir config
RUN wget https://github.com/romslf/Ultimate-Proxy/releases/download/2.2.1.6/UltimateProxy-v2.2.1.6-linux-x64.zip
RUN unzip UltimateProxy-v2.2.1.6-linux-x64.zip && \
   chmod +x UltimateProxyV2 && \
   cp config.json ./config/config.json && \
   cp -r Config*Examples/ ./config/ && \
   rm -r Config*Examples && \
   rm config.json && \
   rm UltimateProxy-v2.2.1.6-linux-x64.zip
EXPOSE 4444


ENTRYPOINT ["./UltimateProxyV2","./config/config.json"]
