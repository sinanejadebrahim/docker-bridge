# ubiquitous-chainsaw
if you live in iran like me, this is the easiest way , you don't need nexus or jfrog or anything else<br>
install webhook with 
```
apt install webhook -y
```
<br>
you need a server outside of IRAN or connected to a vpn. (a server that can pull images without any restrictions)<br>
first create two DIRS:

```
mkdir /root/imager /root/images
copy files in server folder to /root/imager

# run your server with:

webhook -hooks /root/imager/server.json -port 54321 -verbose 2>&1 >> /root/imager/logs
```
just change IP in (client.sh & server/run.sh) with your servers IP <br>that's it, now you can pull any image that you want like this<br>
```
./client.sh 'nginx' 
./client.sh 'registry.rocket.chat/rocketchat/rocket.chat:latest'
```
