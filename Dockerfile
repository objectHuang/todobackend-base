FROM ubuntu:trusty

#prevent dpkg errors
ENV TERM=xterm-256color

#Install Python Runtime
RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggest=false \
    python python-virtualenv libpython2.7 python-mysqldb

#Create Virtual Enviroment
#Upgrade PIP in Virtual Enviroment to last version
RUN virtualenv /appenv && \
    . /appenv/bin/activate&& \
    pip install pip --upgrade

#Add entry point script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

LABEL application=todobackend
