#!/usr/bin/env bash

DOMAIN=$1

if [ -z "${DOMAIN}" ]; then
DOMAIN=example.org
fi


PASS_FILE=`mktemp`

echo "password" > $PASS_FILE

rm -rf /var/db/ca

ca create-root-ca \
	-p $PASS_FILE \
	-o $DOMAIN \
	-u Operations \
	-d $DOMAIN \
	-c CA \
	-f /var/db/ca \
	-l Quebec \
	-s Quebec \
	-n $DOMAIN


ca create-signing-ca \
	-p $PASS_FILE \
	-q $PASS_FILE \
	-o $DOMAIN \
	-u Operations \
	-d $DOMAIN \
	-c CA \
	-f /var/db/ca/$DOMAIN \
	-l Quebec \
	-s Quebec \
	-n $DOMAIN

ca create-server \
	-f /var/db/ca/$DOMAIN \
	-p $PASS_FILE \
	-s www.$DOMAIN

ca create-client \
	-f /var/db/ca/$DOMAIN \
	-p $PASS_FILE \
	-c john.smith@$DOMAIN

rm -f $PASS_FILE
