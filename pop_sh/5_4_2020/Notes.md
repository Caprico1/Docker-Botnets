# Pop.sh

# Introduction


This is the first of many botnets that I have found within the last year or so that seems to be a botnet as a service.

the first thing that you will see when you open up the code is the ascii art...(classic!)


```

#!/bin/bash
#shell popper
#                                                                     $$\    $$$$$$\
#                                                                   $$$$ |  $$  __$$\
# $$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$\   $$$$$$$\        $$\   $$\ \_$$ |  \__/  $$ |
#$$  __$$\ $$  __$$\ $$  _____|$$  __$$\ $$  _____|       \$$\ $$  |  $$ |   $$$$$$  |
#$$ /  $$ |$$ /  $$ |\$$$$$$\  $$$$$$$$ |$$ /              \$$$$  /   $$ |  $$  ____/
#$$ |  $$ |$$ |  $$ | \____$$\ $$   ____|$$ |              $$  $$<    $$ |  $$ |
#\$$$$$$  |$$$$$$$  |$$$$$$$  |\$$$$$$$\ \$$$$$$$\        $$  /\$$\ $$$$$$\ $$$$$$$$\
# \______/ $$  ____/ \_______/  \_______| \_______|$$$$$$\\__/  \__|\______|\________|
#          $$ | pwning to pwn                      \______|
#          $$ | if this script helped you make some $$ mining monero, throw a little my way?
#          \__| Monero: 47TmDBB14HuY7xw55RqU27EfYyzfQGp6qKmfg6f445eihemFMn3xPhs8e1qM726pVj6XKtyQ1zqC24kqtv8fXkPZ7bvgSPU
#
#
#eyyy we gotz da shellz

```

I'll spare you the details on the...rest of the venacular used in the code for...keeping it PG.

opsec_x12 is a clone of the darmok botnet.

opsec (The author of this botnet from here on out) first started deploying his botnet to disrupt the darmok botnets operations.

This can be seen in earlier iterations where a direct callout of "Thanks for the code idiot(?)" (worse words used...) towards darmok.

So how does this thing work.


# Methodology

## Externally Facing Docker Sockets ("port:2375 product:docker")


As of the writing of this article there are currently 7,531 different devices on the internet that are vulnerable to this style of an attack.

For simplicity sake I'll keep this section brief.


### Docker Socket

Docker is a container ochestration wrapper of containerd. It uses what's called the Docker Socket to interface with the docker daemon (esentially where and how to tell a OS to conduct instructions to the CPU)

Easy diagram:

```
docker
  -> docker socket
  -> daemon
  -> container made
  -> run web app...
```

Right so that pretty much is what happens at the operating system level when you run something like:

`docker run -it ubuntu "/bin/bash"`

Now a the Docker Socket itselft is actually a websocket that is opened on one of three ports (Depending on configuration):

__Ports:__
 * 2375
 * 2376
 * 4243 (idk why...)
