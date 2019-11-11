FROM jmeritt/debian-htpc

RUN apt-get install -y curl gnupg
   

RUN curl https://repo.ombi.turd.me/pubkey.txt | apt-key add - && \
    echo "deb [arch=amd64,armhf] http://repo.ombi.turd.me/stable/ jessie main" |  tee "/etc/apt/sources.list.d/ombi.list" && \
    apt-get update && \
    apt-get install -y ombi

USER htpc

EXPOSE 5000

VOLUME /data

WORKDIR /opt/Ombi

CMD ./Ombi --storage /data
