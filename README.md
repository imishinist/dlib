# Dlib docker iamge

This is a Git repo of the docker repository for `dlib`.

# Supported Dlib versions

- 19.21

# Usage

Copy built include files and shared object files.
And copy `pkgconfig` settting file(`/usr/local/lib64/pkgconfig/dlib-1.pc`).
So specify `PKG_CONFIG_PATH` env.

example: 

Example of building a Golang application using [go-face](https://github.com/Kagami/go-face/).

```Dockerfile
FROM imishinist/dlib:19.21 AS dlib-dev

FROM golang:1.16.0-alpine3.13 AS builder

COPY --from=dlib-dev /usr/local/include/dlib/ /usr/local/include/dlib/
COPY --from=dlib-dev /usr/local/lib64/ /usr/local/lib64/

ENV PKG_CONFIG_PATH /usr/local/lib64/pkgconfig/

COPY . .
RUN go build
```

