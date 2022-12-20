FROM jmeritt/ubuntu-htpc

RUN apt-get update && apt-get install -y curl sqlite3 apt-transport-https gnupg icu-devtools
   

RUN echo "deb https://apt.ombi.app/develop jessie main" | tee /etc/apt/sources.list.d/ombi.list && \
    curl -sSL https://apt.ombi.app/pub.key | apt-key add - && \
    apt-get update && \
    apt-get install -y ombi

USER htpc

EXPOSE 5000

VOLUME /data

WORKDIR /opt/Ombi

CMD ./Ombi --storage /data
