#!/usr/bin/env bash

docker image build .
docker image build -t youidea-front .
docker container run -it youidea-front sh
