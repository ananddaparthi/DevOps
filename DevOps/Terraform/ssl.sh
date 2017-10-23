#!/bin/sh

sudo yum install mod_ssl
mkdir /etc/httpd/ssl
cd /etc/httpd/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/apache.key -out /etc/httpd/ssl/apache.crt
echo -e " The Certificate and Key file has been generated!\n"
ls -al /etc/httpd/ssl
exit 0
