FROM ubuntu:trusty
MAINTAINER Henri Dwyer <henri@dwyer.io>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y postfix supervisor syslog-ng-core && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 25

# fix syslog conf
RUN	sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf # Uncomment 'SYSLOGNG_OPTS="--no-caps"' to avoid the following warning: # syslog-ng: Error setting capabilities, capability management disabled; error='Operation not permitted' # http://serverfault.com/questions/524518/error-setting-capabilities-capability-management-disabled# RUN	sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng 

ADD ./postfix.sh /opt/postfix.sh
ADD ./virtual /etc/postfix/virtual
ADD ./supervisord.conf /supervisord.conf

CMD /usr/bin/supervisord -c /supervisord.conf
