android_device_alcatel_cocktail
===============================

CyanogenMod 11.0 device configuration for OT-995. by Bagyusz

How to build:
-------------

Initialize CyanogenMod repo:

    mkdir cm11.0

    cd cm11.0

    repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0

    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.githubusercontent.com/legaCyMod/android_local_manifest/cm-11.0/local_manifest.xml

    repo sync

Update Terminal Emulator:

cd /vendor/cm
./get-prebuilts

Webview pacth [Thx KonstaT]: https://github.com/legaCyMod/android_local_manifest/tree/cm-11.0/patches

    git am -3 patchname.patch

Compile:

    . build/envsetup.sh
    brunch cocktail

    or

    time brunch cocktail


----------------------
Changelog (2014.01.20)

USB Charging      : Okay
USB ADB           : Okay
USB Mass Strorage : Okay
Video             : Okay
Audio             : Okay
Sensors           : Okay
Screen rotation   : Okay
WLAN              : Okay
WLAN Hotspot      : Okay
GPS               : Okay
GSM               : Okay
GSM Data          : Okay
GSM Voice         : Okay
GSM SMS           : Okay
Bluetooth         : Okay
Camera            : Okay
FM Radio          : Okay
Keyboard          : Okay
HDMI              : Okay
SELinux           : Not okay
