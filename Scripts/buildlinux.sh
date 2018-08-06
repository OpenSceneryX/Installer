#!/bin/sh

echo
echo "==========="
echo "Linux Build"
echo "==========="

# Create a tarball of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
cd ..

echo
echo "x86 32-bit"
echo "----------"

cd Builds\ -\ Installer.xojo_project/Linux/
zip -r ../../OpenSceneryX-Installer-Linux-x86-32.zip OpenSceneryX\ Installer
cd ../../

echo
echo "x86 64-bit"
echo "----------"

cd Builds\ -\ Installer.xojo_project/Linux\ 64\ bit/
zip -r ../../OpenSceneryX-Installer-Linux-x86-64.zip OpenSceneryX\ Installer
cd ../../

echo
echo "ARM 32-bit"
echo "----------"

cd Builds\ -\ Installer.xojo_project/Linux\ ARM/
zip -r ../../OpenSceneryX-Installer-Linux-ARM-32.zip OpenSceneryX\ Installer
cd ../../

