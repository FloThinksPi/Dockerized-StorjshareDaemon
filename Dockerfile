FROM docker.io/fedora:latest

MAINTAINER Florian Braun <braunflorian94@gmail.com>
RUN dnf install nodejs python git -y gcc-c++ gcc
RUN dnf groupinstall 'Development Tools' -y 
RUN useradd --user-group --create-home --shell /bin/false storj
RUN npm install --global storjshare-daemon
 
ENV HOME=/home/storj
USER storj
WORKDIR /home/storj

CMD storjshare-daemon start --foreground

