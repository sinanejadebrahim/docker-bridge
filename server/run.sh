#!/bin/bash

IMG=$1

/bin/bash /root/imager/start-server.sh > /dev/null 2>&1

docker pull $IMG >/dev/null 2>&1
docker save $IMG -o /root/images/$IMG.tar

echo "URL: 51.91.199.151:5432/$IMG.tar"
