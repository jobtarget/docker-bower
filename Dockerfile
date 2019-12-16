FROM ubuntu:bionic

LABEL author="fabian@fstab.de, d.sipe@jobtarget.com"

RUN apt-get update

RUN apt-get -y install nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get -y install npm
RUN npm -y install bower -g

RUN adduser --disabled-login --gecos '' bower
USER bower

WORKDIR /home/bower
ADD entrypoint.sh /home/bower/entrypoint.sh
ENTRYPOINT ["/home/bower/entrypoint.sh"]
