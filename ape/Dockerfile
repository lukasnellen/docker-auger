ARG baseimage=lukasnellen/sysdev
FROM $baseimage

# for access to the dev branches, use aperepo=ape/lukas.git 
ARG aperepo=ape.git

# specify branch or tag
ARG apeversion=master

LABEL vendor="Pierre Auger Observatory" \ 
      vendor.url="https://www.auger.org/" \
      maintainers="Lukas Nellen <lukas@nucleares.unam.mx>" \
      name="auger development environment" \
      version="0.01" \
      apeversion=$apeversion 

VOLUME ["/tmp", "/auger/install", "/auger/distfiles"]

RUN echo $aperepo
RUN mkdir -p /auger/dist && \
    cd /auger/dist && \
    git clone -b $apeversion git://devel.auger.unam.mx/$aperepo ape
COPY ape.rc /auger/dist

ENV APERC=/auger/dist/ape.rc USER=auger

WORKDIR /auger/dist/ape

COPY ./entrypoint-ape.sh /
ENTRYPOINT [ "/entrypoint-ape.sh" ]
CMD [ "bash" ]
