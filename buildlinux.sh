#!/bin/sh

echo
echo ------------------------
echo Compressing Linux Installer
echo ------------------------
echo

# Create a tarball of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

cd Builds\ -\ Installer.xojo_project/Linux/
zip -r ../../OpenSceneryX-Installer-Linux.zip OpenSceneryX\ Installer
