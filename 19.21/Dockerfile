FROM alpine:3.13

RUN apk add --no-cache ca-certificates

ENV DLIB_VERSION 19.21

RUN set -eux; \
        apk add --no-cache --virtual .build-deps \
            gcc \
            g++ \
            cmake \
            make \
            libc-dev \
            linux-headers \
            giflib-dev \
            jpeg \
            openblas \
        ; \
        wget -c -q "https://github.com/davisking/dlib/archive/v19.21.tar.gz"; \
        tar xf "v19.21.tar.gz"; \
        mkdir -p dlib-19.21/build; \       
        ( \
          cd dlib-19.21/build; \
          cmake -DDLIB_PNG_SUPPORT=ON -DDLIB_GIF_SUPPORT=ON -DDLIB_JPEG_SUPPORT=ON -DDLIB_NO_GUI_SUPPORT=ON ..; \
          make -j4; \
          make install; \
        ); \
        apk del --no-network .build-deps; \
        rm -rf /dlib-19.21; \
        rm v19.21.tar.gz
