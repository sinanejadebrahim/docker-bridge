#!/bin/bash
echo "    made by: "
echo -e "\e[0;35m 😈 SINA NEJADEBRAHIM 😈 \e[0m \n\n"
echo "Compressing & Pulling the image to make it smaller for download, this might take some time"
for i in {1..3};do
  echo 'Compressing...'
  sleep 1
done
echo "Compression made the image 5 times smaller, Enjoy (: "
{
IMG=$1
TIMG="$(echo $IMG | sed 's/\:/-/' | cut -f2 -d/).tar"
RES=$(curl -s http://IP:54321/hooks/pull?img=$IMG)
while [ -z "$RES" ];
do
  sleep 3
done
} &> /dev/null
echo -e "\e[0;32m"
echo "Downloading image . . ."
wget $(echo $RES | awk '{print $2}') -O /tmp/$TIMG.xz -q --show-progress
echo -e "\e[0m"
{
curl -s http://IP:54321/hooks/stop-server > /dev/null 2>&1
tar axf /tmp/$TIMG.xz 
docker load -i $TIMG
} &> /dev/null

echo "your image is available now"
docker image ls | grep $(echo $IMG | cut -f1 -d:)
rm /tmp/$TIMG.xz
