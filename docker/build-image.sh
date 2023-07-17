#!/bin/bash


docker build -t dotfile-dev . --network=host \
    --build-arg http_proxy=${http_proxy} \
    --build-arg https_proxy=${https_proxy} \
    --build-arg socks_proxy=${socks_proxy} \
    --build-arg USERNAME=`whoami` \
    --build-arg USERID=`id -u` \
    --build-arg GROUPID=`id -g` \



