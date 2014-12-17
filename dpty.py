#!/usr/bin/env python

import dockerpty
import os
from docker.client import Client
from docker.utils import kwargs_from_env

client = Client(base_url=os.environ['DOCKER_HOST'], version=os.environ['DOCKER_SERVER_API_VERSION'])
container = client.create_container(image="debian:wheezy", stdin_open=True, tty=True, command='echo "passed"')
dockerpty.start(client, container)
