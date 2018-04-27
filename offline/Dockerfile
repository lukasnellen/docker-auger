ARG baseimage=lukasnellen/augerdev
FROM $baseimage

VOLUME ["/auger/dist/offline"]

COPY ./entrypoint-externals.sh /entrypoint-externals.sh 
ENTRYPOINT [ "/entrypoint-externals.sh" ]
CMD [ "bash" ]
