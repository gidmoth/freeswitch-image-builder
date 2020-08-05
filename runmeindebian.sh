#!/bin/bash

# Just follow the README here:
# https://github.com/signalwire/freeswitch/tree/master/docker/base_image
# and the freeswitch-installation-instructions here:
# https://freeswitch.org/confluence/display/FREESWITCH/Debian+10+Buster

apt-get update && apt-get install -y gnupg2 wget lsb-release
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add -
 
echo "deb http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list
 
# you may want to populate /etc/freeswitch at this point.
# if /etc/freeswitch does not exist, the standard vanilla configuration is deployed
apt-get update && apt-get install -y freeswitch-meta-all

# make the minimal archive
cd /freeswitch/docker/base_image
./make_min_archive.sh

