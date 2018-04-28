#! /bin/sh

set -e

stage=0
check=no
case "$1" in
    config)
	stage=1
	;;
    build)
	stage=2
	;;
    check)
	stage=2
	check=yes
	;;
    install)
	stage=3
	;;
    check-install)
	stage=3
	check=yes
	;;
esac


if [ $stage -eq 0 ]; then
    exec "$@"
fi

if [ $stage -ge 1 ]; then
    shift
    cmake /auger/dist/offline -Dprefix=/auger/install/offline 
fi

if [ $stage -ge 2 ]; then
    cmake --build . -- "$@"
fi

if [ $check = "yes" ]; then
    cmake --build . -- test-progs "$@"
    ctest
fi

if [ $stage -ge 3 ]; then
    cmake --build . -- install
fi
