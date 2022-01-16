FROM ubuntu:xenial

LABEL mantainer="Michele Forese"
LABEL email="michele.forese.personal@gmail.com"
LABEL name="latex"
LABEL version="0.1"


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
  && apt-get install -qy build-essential wget libfontconfig1 \
  && rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

RUN	mkdir /install-tl-unx; \
  tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
  echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
  /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
  rm -r /install-tl-unx; \
  rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2021/bin/x86_64-linux:${PATH}"

ENV HOME /data
WORKDIR /data

# Install latex packages
RUN tlmgr option repository ctan
RUN tlmgr update --self
RUN tlmgr install latexmk

RUN tlmgr install scheme-full

RUN tlmgr install latexindent

RUN cpan YAML/Tiny.pm
RUN cpan File/HomeDir.pm
RUN cpan Unicode/GCString.pm

VOLUME ["/data"]