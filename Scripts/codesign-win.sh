#!/bin/bash
# Script to sign a Windows build using a Parallels VM

echo
echo Starting Windows Code Signing
echo =============================
echo

echo Opening Parallels VM
echo --------------------

BASEDIR=$(dirname "$0")
cd $BASEDIR

# Start the Parallels VM (this assumes the Parallels is installed with a VM
# called "Windows 10.1")

/usr/local/bin/prlctl start "Windows 10.1"

echo
echo Administrator Launch
echo --------------------

# Trying to get resource editing to work with Resource Hacker.  Discussion thread here: 
# https://www.askvg.com/tutorial-all-about-resource-hacker-in-a-brief-tutorial/

# This works
/usr/local/bin/prlctl exec "Windows 10.1" --resolve-paths --current-user "C:\\Program Files (x86)\\Resource Hacker\\ResourceHacker.exe" -open "../Builds - Installer.xojo_project/Windows 64 bit/OpenSceneryX Installer/OpenSceneryX Installer.exe" -save "Manifest.rc" -action extract -mask MANIFEST,1,1033

# This works
/usr/local/bin/prlctl exec "Windows 10.1" --resolve-paths --current-user powershell -Command "(gc MANIFEST1_1.txt) -replace 'asInvoker', 'requireAdministrator' | Out-File MANIFEST1_1_Modified.txt"

# This doesn't work
/usr/local/bin/prlctl exec "Windows 10.1" --resolve-paths --current-user "C:\\Program Files (x86)\\Resource Hacker\\ResourceHacker.exe" -open "../Builds - Installer.xojo_project/Windows 64 bit/OpenSceneryX Installer/OpenSceneryX Installer.exe" -save "OpenSceneryX Installer mod.exe" -action addoverwrite MANIFEST1_1.txt,MANIFEST,1,

echo
echo
echo Signing
echo -------

# Code Sign (this assumes the Windows 10.1 VM has signtool installed)
# Docs on prlctl exec:
# https://download.parallels.com/desktop/v13/docs/en_US/Parallels%20Desktop%20Pro%20Edition%20Command-Line%20Reference.pdf
# Note that you just append command line args on to the end of the shell command, don't
# try to wrap quotes around everything.
# --resolve-paths uses magic to convert Mac paths into Windows paths inside the VM
# --current-user runs the command as the current Mac user, which is necessary

read -sp 'Certificate Password: ' PASSWORD

/usr/local/bin/prlctl exec "Windows 10.1" --resolve-paths --current-user "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x64\\signtool.exe" sign /v /f "../Certificates/COMODO/Austin Goudge.p12" /p $PASSWORD /d "OpenSceneryX Installer" /t http://timestamp.verisign.com/scripts/timestamp.dll "../Builds - Installer.xojo_project/Windows 64 bit/OpenSceneryX Installer/OpenSceneryX Installer.exe"

echo Complete
echo --------

sleep 5
