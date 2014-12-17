#!/bin/bash -e

which docker && which fig && which python && which pip && which ruby && which sudo

docker pull debian:wheezy
sudo pip install docker-py
sudo pip install dockerpty
