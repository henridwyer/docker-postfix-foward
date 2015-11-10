#!/bin/bash

# fix postfix settings
echo "virtual_alias_domains = "$DOMAINS >> /etc/postfix/main.cf
echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> /etc/postfix/main.cf
#sed 's/smtpd_use_tls=yes/smtpd_use_tls=no/' /etc/postfix/main.cf

postmap /etc/postfix/virtual
service postfix reload
service postfix restart
tail -f /var/log/mail.log
