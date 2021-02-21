FROM buildpack-deps:buster-scm

ENV DLIB_VERSION 19.21

RUN set -eux; \
        apt-get update; apt-get install -y --no-install-recommends \
            build-essential \
            cmake; \
        rm -rf /var/lib/apt/lists/*; \
        wget -c -q "https://github.com/davisking/dlib/archive/v19.21.tar.gz"; \
        tar xf "v19.21.tar.gz"; \
        mkdir -p dlib-19.21/build; \       
        ( \
          cd dlib-19.21/build; \
          cmake -DDLIB_PNG_SUPPORT=ON -DDLIB_GIF_SUPPORT=ON -DDLIB_JPEG_SUPPORT=ON -DDLIB_NO_GUI_SUPPORT=ON ..; \
          make -j4; \
          make install; \
        ); \
        rm -rf /usr/local/lib64/cmake; \
        rm -rf /dlib-19.21; \
        rm v19.21.tar.gz; \
        apt-get remove -y --purge \
            build-essential \
            cmake; \
        apt-get autoremove -y; \
        apt-get clean; \
        rm -rf /var/cache;
