#!/bin/sh

echo
echo "==========="
echo "Linux Build"
echo "==========="

VERSION=$1

if [ -z $VERSION ]
then
    echo "Usage: buildlinux.sh [version]"
    exit
fi

# Create a tarball of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
cd ..

echo
echo "x86 32-bit"
echo "----------"

cd Builds\ -\ Installer/Linux/
zip -r ../../OpenSceneryX-Installer-Linux-x86-32-$VERSION.zip OpenSceneryX\ Installer
cd ../../

echo
echo "x86 64-bit"
echo "----------"

cd Builds\ -\ Installer/Linux\ 64\ bit/
zip -r ../../OpenSceneryX-Installer-Linux-x86-64-$VERSION.zip OpenSceneryX\ Installer
cd ../../

echo
echo "ARM 32-bit"
echo "----------"

cd Builds\ -\ Installer/Linux\ ARM/
zip -r ../../OpenSceneryX-Installer-Linux-ARM-32-$VERSION.zip OpenSceneryX\ Installer
cd ../../

