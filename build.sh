#!/bin/bash

tag="19.21"
latest=$tag

docker build ./${tag}/ -t imishinist/dlib:${tag}
docker push imishinist/dlib:${tag}

docker build ./${latest}/ -t imishinist/dlib
docker push imishinist/dlib
