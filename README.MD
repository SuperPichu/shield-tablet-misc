# Shield Tablet Miscellaneous Tools

This is really just so I have a backup of these scripts and to document changes to the updater-script. But here is some documentation anyway:

##Documentation
###build.sh
>#### Pre-requisites for build.sh:
>>* Kernel source in: 
	~/dev/shield-tablet/shield-tablet-kernel

>>* Android eabi toolchain in:
	~/dev/android-toolchain-eabi

>>* mkbootimg utility

>>* Ramdisk *.cpio.gz's in:
	~/dev/shield-tablet/build/ramdisk

>>* A "zips" directory (unzipped update.zip hierarchy) containing a working update-binary, the updater-script,  and an "img" directory in the root

>>* Designed to be run from ~/dev/shield-tablet

>>* Optional: notify-send and supported DE for finish notification. 

>####Output of build.sh:
>>build.sh will output 3 zip files corresponding to each SKU of the tablet (US LTE, ROW LTE, and WiFi Only).

###test.sh
>#### Pre-requisites for test.sh:
>>* Kernel source in: 
	~/dev/shield-tablet/shield-tablet-kernel

>>* Android eabi toolchain in:
	~/dev/android-toolchain-eabi

>>* Working adb and fastboot

>>* mkbootimg utility

>>* Ramdisk *.cpio.gz's in:
	~/dev/shield-tablet/build/ramdisk

>>* Designed to be run from ~/dev/shield-tablet

>>* Optional: notify-send and supported DE for finish notification. 
>####Output of test.sh:
>>test.sh will reboot the tablet into bootloader mode and build and boot a boot.img for the WiFi Only version of the tablet (SKU could be changed very easily).

###updater-script:
>This is just the update script that gets used in the zip files.