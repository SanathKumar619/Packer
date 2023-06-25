#!/bin/bash

sleep 30

sudo apt update

sudo apt install python3 -y

sudo apt install apache2 -y

sudo apt install unzip -y

systemctl enable apache2
systemctl start apache2

cd /tmp

sudo unzip 2135_mini_finance.zip

sudo mv 2135_mini_finance/* /var/www/html


sudo touch /aa.txt
cd /
sudo echo "HI Baby" >> /aa.txt

sudo mv /tmp/rama.txt /etc/rama.txt

echo "Everything is Done"
