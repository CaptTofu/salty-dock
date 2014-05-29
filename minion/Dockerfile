# simple SSH container Dockerfile
#
# VERSION    0.0.1
#
FROM ubuntu:13.04
MAINTAINER Patrick aka CaptTofu Galbraith , patg@patg.net

# Update distribution
RUN apt-get update \
      && apt-get upgrade -y \
      && apt-get clean

RUN apt-get install -y openssh-server vim salt-minion libterm-readline-gnu-perl libterm-readline-perl-perl

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh

# entrypoint script
ADD entrypoint.sh /usr/local/sbin/entrypoint.sh
RUN chmod 755 /usr/local/sbin/entrypoint.sh

ADD docker.pem.pub /root/.ssh/authorized_keys
RUN chown -R root:root /root/.ssh
ADD minion.conf /etc/salt/minion

# Expose sshd
EXPOSE 22 49505 49506

CMD /usr/local/sbin/entrypoint.sh
