#!/bin/sh

echo
echo "========="
echo "Mac Build"
echo "========="

# Create a zip of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

echo "Creating Disk Image"
echo "-------------------"

# Copy the template dmg to a working copy
cp ../Support/template.dmg wc.dmg
# Create an empty folder and mount the working copy dmg at the folder location
mkdir -p wc
hdiutil attach wc.dmg -noautoopen -quiet -mountpoint wc
# Remove the existing (empty) Installer directory inside the DMG
rmdir wc/OpenSceneryX\ Installer.app
# Copy the new installer in
ditto -rsrc ../Builds\ -\ Installer.xojo_project/OS\ X\ 64\ bit/OpenSceneryX\ Installer.app wc/OpenSceneryX\ Installer.app
# Unmount the working copy dmg
WC_DEV=`hdiutil info | grep "wc" | grep "/dev/disk" | awk '{print $1}'` && hdiutil detach $WC_DEV -quiet -force
# Create the final, compressed DMG
rm -f OpenSceneryX-Installer.dmg
hdiutil convert wc.dmg -quiet -format UDZO -imagekey zlib-level=9 -o OpenSceneryX-Installer.dmg
# Clean up
rmdir wc
rm -f wc.dmg

mv OpenSceneryX-Installer.dmg ..

echo "Finished"
echo "--------"