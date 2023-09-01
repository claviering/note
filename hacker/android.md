# Android 逆向

1. apktool d -s -f your.apk // 得到 classes.dex
2. sh d2j-dex2jar.sh ~/path/to/classes.dex // 得到 classes-dex2jar.jar
3. jd-gui 打开 classes-dex2jar.jar