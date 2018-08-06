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

# Move STDIN to file descriptor 3 and remap STDIN to /dev/null.  This is needed because some of the prlctl
# commands below cause STDIN to become blocked, meaning the `read` command fails with
# 'read error: 0: Resource temporarily unavailable'.

exec 3<&0 0</dev/null

# Start the Parallels VM (this assumes the Parallels is installed with a VM
# called "Windows 10.1")

/usr/local/bin/prlctl start "Windows 10.1"

echo
echo Administrator Launch
echo --------------------

# Modify the Manifest to ensure the app runs as administrator.
# This requires the executable from the electron project: https://github.com/electron/rcedit to be present 
# at 'C:\Program Files (x86)\rcedit\rcedit-x64.exe' within the VM.

/usr/local/bin/prlctl exec "Windows 10.1" --resolve-paths --current-user "C:\\Program Files (x86)\\rcedit\\rcedit-x64.exe" "../Builds - Installer.xojo_project/Windows 64 bit/OpenSceneryX Installer/OpenSceneryX Installer.exe" --set-requested-execution-level "requireAdministrator"
echo Done

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

read -sp 'Certificate Password: ' PASSWORD 0<&3

/usr/local/bin/prlctl exec "Windows 10.1" --resolve-paths --current-user "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x64\\signtool.exe" sign /v /f "../Certificates/COMODO/Austin Goudge.p12" /p $PASSWORD /d "OpenSceneryX Installer" /t http://timestamp.verisign.com/scripts/timestamp.dll "../Builds - Installer.xojo_project/Windows 64 bit/OpenSceneryX Installer/OpenSceneryX Installer.exe"

echo Complete
echo --------

sleep 5
