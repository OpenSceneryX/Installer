Notarizing with Apple
=====================

From Mojave onwards, Gatekeeper will soon start to require that an application is Notarized with Apple.  As we have a `.dmg` package, the notarization is done on the DMG using the following command from the directory where OpenSceneryX-Installer.dmg is located:

```bash
$ xcrun altool --type osx --notarize-app --file OpenSceneryX-Installer.dmg --primary-bundle-id com.aussi.opensceneryx.installer --username <username> -itc_provider <team_id>
```

* This will request a password, which is an app-specific password [generated here](https://appleid.apple.com/account/manage) (stored in Keychain)

* The `username` is the email address for the Apple Developer ID

* The iTunesConnect `team_id` needs to be passed in as the itc_provider, [this can be found here](https://developer.apple.com/account/#/membership/)

* The command returns a request UUID

The notarization process takes time on the Apple side. To check the status of a notarization:

```bash
$ xcrun altool --notarization-info <request_uuid> -u <username> -p
```

Once notarization is complete, staple the ticket to the dmg:

```bash
$ xcrun stapler staple -v OpenSceneryX-Installer.dmg
```

And to verify an installed application after download:

```bash
$ spctl -a -v /Applications/OpenSceneryX\ Installer.app/
```

For more info, [the full thread is here](https://forum.xojo.com/50655-how-to-codesign-and-notarise-your-app-for-macos-10-14-and-highe).