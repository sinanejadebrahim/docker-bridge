#!/bin/bash

IMG=$1
IP=$2
TIMG="$(echo $IMG | sed 's/\:/-/' | cut -f2 -d/).tar"
/bin/bash /root/imager/start-server.sh > /dev/null 2>&1

docker pull $IMG >/dev/null 2>&1

docker save $IMG -o /root/images/$TIMG
cd /root/images
tar acf "$TIMG.xz" "$TIMG"
rm $TIMG

echo "URL: IP:5432/$TIMG.xz"
