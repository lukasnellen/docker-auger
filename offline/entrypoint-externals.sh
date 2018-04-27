#! /bin/sh

APE=/auger/dist/ape/ape
export APERC=/auger/dist/ape.rc
eval $(${APE} sh externals)
mkdir /tmp/offline
cd /tmp/offline
export CM="cmake /auger/dist/offline -Dprefix=/auger/install/offline"

echo "Execute \$CM for default cmake configuration"

if [ -n "${RHDEVTOOLSET}" ]; then
     exec scl enable ${RHDEVTOOLSET} /entrypoint-externals-stage2.sh "$@"
else
    exec /entrypoint-externals-stage2.sh "$@"
fi
