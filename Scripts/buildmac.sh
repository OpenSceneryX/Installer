#!/bin/sh

echo
echo "========="
echo "Mac Build"
echo "========="

VERSION=$1

if [ -z $VERSION ]
then
    echo "Usage: buildmac.sh [version]"
    exit
fi

# Zipping should exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

echo "Creating zip (for auto-updater install)"
echo "---------------------------------------"

cd ../Builds\ -\ Installer/OS\ X\ 64\ bit/
# Use ditto here with -c -k --sequesterRsrc --keepParent, not zip, to maintain UTF8 code signing signature https://forums.developer.apple.com/thread/116831
ditto -c -k --sequesterRsrc --keepParent OpenSceneryX\ Installer.app ../../OpenSceneryX-Installer-Mac-$VERSION.zip
cd ../../Scripts

echo "Creating Disk Image (for manual initial install)"
echo "------------------------------------------------"

# Copy the template dmg to a working copy
cp ../Support/template.dmg wc.dmg
# Create an empty folder and mount the working copy dmg at the folder location
mkdir -p wc
hdiutil attach wc.dmg -noautoopen -quiet -mountpoint wc
# Remove the existing (empty) Installer directory inside the DMG
rmdir wc/OpenSceneryX\ Installer.app
# Copy the new installer in
ditto -rsrc ../Builds\ -\ Installer/OS\ X\ 64\ bit/OpenSceneryX\ Installer.app wc/OpenSceneryX\ Installer.app
# Unmount the working copy dmg
WC_DEV=`hdiutil info | grep "wc" | grep "/dev/disk" | awk '{print $1}'` && hdiutil detach $WC_DEV -quiet -force
# Create the final, compressed DMG
rm -f OpenSceneryX-Installer*.dmg
hdiutil convert wc.dmg -quiet -format UDZO -imagekey zlib-level=9 -o OpenSceneryX-Installer-Mac-$VERSION.dmg
# Clean up
rmdir wc
rm -f wc.dmg

mv OpenSceneryX-Installer-Mac-$VERSION.dmg ..

echo "Finished"
echo "--------"