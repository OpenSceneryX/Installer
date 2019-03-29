Building and Deploying the Installer
====================================

Prerequisites and Notes
-----------------------

* The Windows version of the installer needs the `zlib1` DLL to be included at the same level as the executable.  This is done by a Windows build step, but the DLL must be downloaded and present at `Libraries/zlib1-64/zlib1.dll`

* The Windows version needs to run as an administrator.  This is done by a Windows build step, but the Windows VM (or machine) must have [rcedit](https://github.com/electron/rcedit) installed.

* If the build is done on a Mac with Parallels installed (and a VM called "Windows 10" present), the Windows version is signed automatically during the build, but signtool needs to be installed which is part of the [Windows 10 SDK](https://go.microsoft.com/fwlink/?LinkID=698771).

* If rcedit and signing needs to be done manually for Windows (e.g. if build / signing is done on a real Windows machine, not via Parallels) then there is a utility script available for this in `Scripts/codesign-win-manual.cmd`.

* The Mac app is signed automatically by the build process.


Building
--------

* Clear out any old builds / zips

* Update version number in app

* Update `versioninfo/installerversion.txt` with new version number

* Update `versioninfo/installerreleasenotes.html` with new version number

* Tag release with new version number

* Build app for all platforms

* If not using a Parallels VM for the Windows signing and resource fork editing, copy the Windows build across to the Windows machine and perform those steps, then copy it back in place (using a Parallels VM, this is done automatically as part of the build).

* Run `Scripts/buildall.sh`

* Notarize Mac `.dmg` - see separate [notarizing instructions](notarizing.md)

* Upload all installers to the AWS S3 bucket, replacing existing versions.

* In AWS S3 console, select new uploads and choose _Actions -> Make Public_

* Upload `versioninfo/installerversion.txt` and `versioninfo/installerreleasenotes.html` to hosting servers, replacing existing versions.

* In AWS Cloudfront console, create invalidatation in `downloads.opensceneryx.com` distribution for the following paths:
    ```
    /OpenSceneryX-Installer-Mac.dmg
    /OpenSceneryX-Installer-Windows.zip
    /OpenSceneryX-Installer-Linux-x86-64.zip
    /OpenSceneryX-Installer-Linux-x86-32.zip
    /OpenSceneryX-Installer-Linux-ARM-32.zip
    ```
* Clear Cloudflare cache for the following URLs:

    ```
    https://downloads.opensceneryx.com/OpenSceneryX-Installer.dmg
    https://downloads.opensceneryx.com/OpenSceneryX-Installer-Windows.zip
    https://downloads.opensceneryx.com/OpenSceneryX-Installer-Linux-x86-64.zip
    https://downloads.opensceneryx.com/OpenSceneryX-Installer-Linux-x86-32.zip
    https://downloads.opensceneryx.com/OpenSceneryX-Installer-Linux-ARM-32.zip
    https://www.opensceneryx.com/versioninfo/installerreleasenotes.html
    https://www.opensceneryx.com/versioninfo/installerversion.txt
    ```

* Promotion:

    - Post a new reply to the [x-plane.org main OpenSceneryX thread](https://forums.x-plane.org/index.php?/forums/topic/25174-opensceneryx-v320-released/&do=findComment&comment=277394)
	- Post an article on the site
	- Tweet
    - Reddit [r/Xplane](https://www.reddit.com/r/Xplane/)


Customising the DMG
-------------------

* The template DMG should be saved as `Support/template.dmg` (git ignored).  This is created using Disk Utility and then customised.

* The background image is modified by copying a new one into `/Volumes/OpenSceneryX Installer/.background` with the DMG mounted

* The icon positions are changed by simply moving them in the template DMG and closing it.

* Other customisations are done by _View -> Show View Options…_ in the DMG.
