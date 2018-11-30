FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install opensmtpd

COPY smtpd.conf /etc/smtpd.conf

CMD /usr/sbin/smtpd -d

