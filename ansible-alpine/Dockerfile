FROM alpine:latest

ENV LANG C.UTF-8

RUN set -ex \
  && apk add --no-cache --virtual .build-deps  \
                gfortran \
                build-base \
                openblas-dev \
                bzip2-dev \
                coreutils \
                dpkg-dev dpkg \
                expat-dev \
                gcc \
                gdbm-dev \
                libc-dev \
                libffi-dev \
                libnsl-dev \
                libressl \
                libressl-dev \
                libtirpc-dev \
                linux-headers \
                make \
                ncurses-dev \
                pax-utils \
                readline-dev \
                sqlite-dev \
                tcl-dev \
                tk \
                tk-dev \
                xz-dev \
                zlib-dev \
                libxml2-dev \
                libxslt-dev \
                musl-dev \
                libgcc \
                curl \
                jpeg-dev \
                zlib-dev \
                freetype-dev \
                lcms2-dev \
                openjpeg-dev \
                tiff-dev \
                tk-dev \
                tcl-dev \
  \
  && apk add  --no-cache \
    curl \
    openssh-client \
    tar \
    python3 \
    py3-pip \
  \
  && apk add --no-cache --virtual .py-build-deps python3-dev \
  \
  && pip3 install --upgrade pip \
  && pip install ansible \
  && apk del .build-deps \
  && apk del .py-build-deps \
  && rm -rf /var/cache/apk/* \
  && ansible --version

# RUN mkdir /etc/ansible/ /ansible
# RUN echo "[local]" >> /etc/ansible/hosts && \
#     echo "localhost" >> /etc/ansible/hosts

# RUN mkdir -p /ansible/playbooks
# WORKDIR /ansible/playbooks

# ENV ANSIBLE_GATHERING smart
# ENV ANSIBLE_HOST_KEY_CHECKING false
# ENV ANSIBLE_RETRY_FILES_ENABLED false
# ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
# ENV ANSIBLE_SSH_PIPELINING True
# ENV PATH /ansible/bin:$PATH
# ENV PYTHONPATH /ansible/lib

# ENTRYPOINT ["ansible-playbook"]