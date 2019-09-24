# duct-tape-dns-seeder  

cloudflare.cfg  (update your email and api key after moving to ~/.cloudflare)
```
mkdir ~/.cloudflare
cp cloudflare.cfg.example ~/.cloudflare/cloudflare.cfg
```

crontab -e
```
# update A records
0 * * * * /usr/local/bin/denariusd getpeerinfo > /root/duct-tape-dns-seeder/peer.json
1 * * * * /bin/sh /root/duct-tape-dns-seeder/jq.sh
2 * * * * cd /root/duct-tape-dns-seeder && /bin/sh /root/duct-tape-dns-seeder/seed.sh peers.txt
```
