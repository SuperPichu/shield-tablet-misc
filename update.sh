echo -n "Enter version: "
read version
cd ~/dev/shield-tablet/updates
cp seed.xml update.xml
sed -i 2a"<version>$version</version>" update.xml
sed -i 4a"&<wx_na_do url=\"http://github.com/SuperPichu/shield-tablet-kernel/releases/download/$version/Kernel-LTE-US-$version.zip\"/>" update.xml
sed -i 5a"&<wx_un_do url=\"http://github.com/SuperPichu/shield-tablet-kernel/releases/download/$version/Kernel-LTE-ROW-$version.zip\"/>" update.xml
sed -i 6a"&<wx_na_wf url=\"http://github.com/SuperPichu/shield-tablet-kernel/releases/download/$version/Kernel-LTE-WiFi-$version.zip\"/>" update.xml
sed -i 's/&/\t\t/' update.xml
scp update.xml chris@superpichu.org:/var/www/superpichu.org/public_html/kernel/update.xml
rm update.xml

