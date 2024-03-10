#!/bin/bash

sudo apt-get update

sudo apt-get install -y docker.io

sudo usermod -aG docker ubuntu   # Here u need to change from Ubuntu to your user

newgrp docker

sudo chmod 777 /var/run/docker.sock
