Upgrading Thomas Tempelmann's Zip package
=========================================

To do this, open his project separately in Xojo, then select 'Export' on the ZipPackage folder, and replace the previous ZipPackage folder with the exported version.

When reopening the installer in Xojo, it will complain about missing files.  Cancel all these dialogs, then delete the ZipPackage folder from the project and re-add it (dragging in from the file system works fine).