#!/bin/bash
## This should show what lines are not making it through gravity.sh

## set this
HOSTIP="192.168.1.99"
LISTTOCOMPARE="/etc/pihole/list.0.raw.githubusercontent.com.domains"

## Pi-Hole Gravity
GRAVITY="/etc/pihole/gravity.list"
GRAVITYTRIMMED="/etc/pihole/gravity.list.trimmed"
ANTIGRAV="/etc/pihole/antigrav.list"

sed 's/^"$HOSTIP"[ \t]*//' < $GRAVITY > $GRAVITYTRIMMED
sudo gawk 'NR==FNR{a[$0];next} !($0 in a)' $LISTTOCOMPARE $GRAVITYTRIMMED > $ANTIGRAV
sudo rm $GRAVITYTRIMMED
