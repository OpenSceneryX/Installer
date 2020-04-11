#!/bin/sh

VERSION=$1

if [ -z $VERSION ]
then
    echo "Usage: buildall.sh [version]"
    exit
fi

./buildmac.sh $VERSION
./buildlinux.sh $VERSION
./buildwin.sh $VERSION
