#!/bin/sh

echo
echo "========="
echo "Mac Build"
echo "========="

# Create a zip of OpenSceneryX Installer but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

cd Builds\ -\ Installer.xojo_project/Mac\ OS\ X\ \(Cocoa\ Intel\)/

echo
echo "Setting plist entries"
echo "---------------------"
/usr/libexec/PlistBuddy -c "Delete :NSHumanReadableCopyright" OpenSceneryX\ Installer.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Delete :LSApplicationCategoryType" OpenSceneryX\ Installer.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :NSHumanReadableCopyright string '© 2015, Austin Goudge'" OpenSceneryX\ Installer.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :LSApplicationCategoryType string 'public.app-category.simulation-games'" OpenSceneryX\ Installer.app/Contents/Info.plist

echo
echo "Code signing"
echo "------------"
codesign --signature-size 6400 -f -v -s 'Austin Goudge' OpenSceneryX\ Installer.app

echo
echo "Zipping"
echo "-------"
zip -r ../../OpenSceneryX-Installer-Mac.zip OpenSceneryX\ Installer.app
