# Set up apt source
```shell
echo deb [signed-by=$PREFIX/share/keyrings/lifegpc.asc] https://android.lifegpc.com lifegpc main >> $PREFIX/etc/apt/sources.list
mkdir -p $PREFIX/share/keyrings
curl -L "https://github.com/lifegpc/lifegpc/raw/master/android.asc" -o $PREFIX/share/keyrings/lifegpc.asc
apt update
```
