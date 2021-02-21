#!/bin/bash

tag="19.21"

docker build ./${tag}/ -t imishinist/dlib:${tag}
docker push imishinist/dlib:${tag}
