#!/usr/bin/bash
export ARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH=~/dev/android-toolchain-eabi/bin:$PATH
cd ~/dev/shield-tablet/shield-tablet-kernel
export version=$1
make -j 10 clean
make -j 10 tegra12_android_defconfig
make -j 10 tegra124-tn8-p1761-1270-a04-e-battery.dtb
make -j 10
cat arch/arm/boot/zImage arch/arm/boot/dts/tegra124-tn8-p1761-1270-a04-e-battery.dtb > ~/dev/shield-tablet/build/zImage
cd ~/dev/shield-tablet/build
./mkbootimg --kernel zImage --ramdisk ramdisk/row.cpio.gz -o zips/img/boot.img
mkdir out/$version
cd zips
rm *.zip
zip -r ../out/$version/Kernel-LTE-ROW-$version.zip *
rm img/boot.img
cd ..
./mkbootimg --kernel zImage --ramdisk ramdisk/wifi.cpio.gz -o zips/img/boot.img
cd zips
zip -r ../out/$version/Kernel-WiFi-$version.zip *
rm img/boot.img
cd ..
./mkbootimg --kernel zImage --ramdisk ramdisk/us.cpio.gz -o zips/img/boot.img
cd zips
zip -r ../out/$version/Kernel-LTE-US-$version.zip *
rm img/boot.img
notify-send "Kernel Build Complete"
