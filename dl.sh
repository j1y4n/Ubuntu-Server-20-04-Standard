#!/bin/sh

apt-get update && apt-get upgrade

apt install git

cd /home

git clone https://github.com/j1y4n/Ubuntu-Server-20-04-Standard.git

cd Ubuntu-Server-20-04-Standard

chmod +x std.sh

./std.sh