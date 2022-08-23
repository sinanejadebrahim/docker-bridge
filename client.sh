#!/bin/bash
echo "    made by: "
echo -e "\e[0;35m 😈 SINA NEJADEBRAHIM 😈 \e[0m \n\n"
echo -e "working . . ."
{
IMG=$1
RES=$(curl -s http://IP:PORT/hooks/pull?img=$IMG)

while [ -z "$RES" ];
do
  sleep 5
done
} &> /dev/null
echo -e "\e[0;32m"
echo "Downloading image . . ."
wget $(echo $RES | awk '{print $2}') -O /tmp/$IMG.tar -q --show-progress
echo -e "\e[0m"
{
curl -s http://IP:PORT/hooks/stop-server > /dev/null 2>&1
docker load -i /tmp/$IMG.tar
} &> /dev/null

echo "your image is available now"
docker image ls | grep $IMG
rm /tmp/$IMG.tar 
