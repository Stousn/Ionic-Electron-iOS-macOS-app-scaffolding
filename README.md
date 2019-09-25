# Ionic/Electron iOS & macOS app scaffolding
Scaffolding Script to initialize an Ionic and Electron Cross-Platform application that targets iOS and macOS

## Execution
Just run the script  
`./init.sh`

## Prerequesites
* BASH
* node / npm (latest stable / lts version recommended)
* Git

## Tested with
* macOS Mojave
* Linux Mint 19.1 "Tessa"

## Error handling
* Recently a bug within a dependency of Ionic caused the script to run endlessly (see [ionic-team/ionic-cli#4158](https://github.com/ionic-team/ionic-cli/issues/4158))
* If this happens to you, run the following commands first:
  * `npm uninstall -g ionic`
  * `npm uninstall -g cordova`
