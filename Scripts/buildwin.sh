#!/bin/sh

echo
echo "============="
echo "Windows Build"
echo "============="

# Create a zip of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
cd ..

cd Builds\ -\ Installer.xojo_project/Windows\ 64\ bit/

echo
echo "Zipping"
echo "-------"
zip -r ../../OpenSceneryX-Installer-Windows.zip OpenSceneryX\ Installer

