# ubiquitous-chainsaw

<br>
i didn't know what to name this thing - so i used github's recommendation :D <br>
i know there are lots of other ways to go around this problem - but this way you just need one server - and any where in the world you can downlaod your images - and also you get to work with webhooks - you can also customize the shit out of this - change response and request to what ever you like .
you can also use this template to do alot more stuff with webhooks - so enjoy (: <br>
first put server files in a server eather out of IRAN or connected to  a vpn.then just run client file with your desired image name and it will be loaded to your machine.<br>

### on your server
first install webhooks from here [webhook](https://github.com/adnanh/webhook) or use apt install webhook.<br>
then we need two DIRs
```
mkdir /root/imager
mkdir /root/images
cd /root/imager
# craete our main hooks file
vim run.json
[
  {
    "id": "pull",
    "execute-command": "/root/imager/run.sh",
    "pass-arguments-to-command":
    [
      {
        "source": "query",
        "name": "img"
      }
    ],
        "include-command-output-in-response": true
 },
  {
    "id": "stop-server",
    "execute-command": "/root/imager/pkiller.sh"
 
  }
]
```

we need all files in server folder on our server in the /root/imager directory.then cd to this DIR and run <br>
```
webhook -hooks run.json -port 54321 -verbose
# you can also not use -verbose - it's up to you
```
let me explain this file.<br>
this is your main webhook file. when you run it using a command like this (webhook -hooks run.json -port 54321 -verbose) this address wil be available on your server ( IP:PORT/hooks/pull - IP:PORT/hooks/stop-server ) now as you can see on the first hook - it takes an argument named img from the query wich we use to define our image names.for example if i wanted to call this hook with nginx docker image this is what i would do ( curl -s 'http://IP:PORT/hooks/pull?img=nginx:latest' ),then our webhook takes this name and passed it to our run.sh scripts .<br>
now our scripts is going to download that image on the server - save it as a tar file and use python to broadcast that file on a port,then the run.sh scripts gives a url which we pass as response to our hook caller.<br>there is also a stop-server query which our client file calls when the image has been loaded on our client succesfully - which will stop the python webserver.<br>
you can just run client file with a img name and everything will be taken care of in the background. ( ./client.sh 'nginx:latest' )
this still need alot of work - it's just an idea for now and will be upgraded in the future.<br>
#### there is a gif here which shows you how this works - wait for it to load...
