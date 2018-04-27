#! /bin/sh

set -e

stage=0
case "$1" in
    config)
	stage=1
	;;
    build)
	stage=2
	;;
    install)
	stage=3
	;;
esac

echo stage $stage

if [ $stage -eq 0 ]; then
    exec "$@"
fi

if [ $stage -ge 1 ]; then
    shift
    cmake /auger/dist/offline -Dprefix=/auger/install/offline 
fi

if [ $stage -ge 2 ]; then
    make "$@"
fi

if [ $stage -ge 3 ]; then
    make install
fi
