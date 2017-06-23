#!/bin/bash

docker images

echo "--------------------------------------------"
echo "choose which server do you want to start:"

read ServerName

docker run -it -v ~/docker:/usr/Downloads ${ServerName} /bin/bash
