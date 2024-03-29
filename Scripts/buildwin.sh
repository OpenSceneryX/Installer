#!/bin/sh

echo
echo "============="
echo "Windows Build"
echo "============="

VERSION=$1

if [ -z $VERSION ]
then
    echo "Usage: buildwin.sh [version]"
    exit
fi

# Create a zip of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
cd ..

cd Builds\ -\ Installer/Windows\ 64\ bit/

echo
echo "Zipping"
echo "-------"
zip -r ../../OpenSceneryX-Installer-Windows-$VERSION.zip OpenSceneryX\ Installer

