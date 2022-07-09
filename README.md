# Set up apt source
```shell
echo [signed-by=$PREFIX/share/keyrings/lifegpc.asc] https://termux.kanahanazawa.com lifegpc stable >> $PREFIX/etc/apt/sources.list
curl -L "https://github.com/lifegpc/lifegpc/raw/master/public.asc" -o $PREFIX/share/keyrings/lifegpc.asc
apt update
```
