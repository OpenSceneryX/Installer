Notarizing with Apple
=====================

From Catalina onwards, Gatekeeper requires that an application is Notarized with Apple.  As we have both a .dmg package (for manual initial download) and a zip (for the auto-update mechanism), the notarization is done both using the following commands from the directory where OpenSceneryX-Installer-Mac-<version>.dmg and OpenSceneryX-Installer-Mac-<version>.zip are located:

```bash
$ xcrun altool --type osx --notarize-app --file OpenSceneryX-Installer-Mac-<version>.dmg --primary-bundle-id com.aussi.opensceneryx.installer --username <username> -itc_provider <team_id>
$ xcrun altool --type osx --notarize-app --file OpenSceneryX-Installer-Mac-<version>.zip --primary-bundle-id com.aussi.opensceneryx.installer --username <username> -itc_provider <team_id>
```

* The `username` is the email address for the Apple Developer ID

* The iTunesConnect `team_id` needs to be passed in as the itc_provider, [this can be found here](https://developer.apple.com/account/#/membership/)

* The `version` is the version number used for the build

* These commands will request a password, which is an app-specific password [generated here](https://appleid.apple.com/account/manage) (stored in Keychain)

* The commands each return a request UUID

The notarization process takes time on the Apple side. To check the status of a notarization:

```bash
$ xcrun altool --notarization-info <request_uuid> -u <username>
```

Once notarization is complete, staple the ticket to the dmg (zips cannot be stapled):

```bash
$ xcrun stapler staple -v OpenSceneryX-Installer-Mac-<version>.dmg
```

And to verify an installed application after download:

```bash
$ spctl -a -v /Applications/OpenSceneryX\ Installer.app/
```

For more info, [the full thread is here](https://forum.xojo.com/50655-how-to-codesign-and-notarise-your-app-for-macos-10-14-and-highe).