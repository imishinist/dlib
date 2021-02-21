#!/bin/bash

tag="19.21"
latest=$tag

default_variant="alpine3.13"
docker build ./${tag}/${default_variant} -t imishinist/dlib:${tag}
docker push imishinist/dlib:${tag}

variant="alpine3.13"
docker build ./${tag}/${variant} -t imishinist/dlib:${tag}-${variant}
docker push imishinist/dlib:${tag}-${variant}

variant="buster"
docker build ./${tag}/${variant} -t imishinist/dlib:${tag}-${variant}
docker push imishinist/dlib:${tag}-${variant}

docker build ./${latest}/${default_variant} -t imishinist/dlib
docker push imishinist/dlib
