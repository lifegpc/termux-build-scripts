# Set up apt source
```shell
echo [signed-by=$PREFIX/share/keyrings/lifegpc.asc] https://android.lifegpc.com lifegpc stable >> $PREFIX/etc/apt/sources.list
curl -L "https://github.com/lifegpc/lifegpc/raw/master/android.asc" -o $PREFIX/share/keyrings/lifegpc.asc
apt update
```
