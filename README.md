# duct-tape-dns-seeder

crontab -e
```
# update A records
0 * * * * /usr/local/bin/denariusd getpeerinfo > /root/duct-tape-dns-seeder/peer.json
1 * * * * /bin/sh /root/duct-tape-dns-seeder/jq.sh
2 * * * * cd /root/duct-tape-dns-seeder && /bin/sh /root/duct-tape-dns-seeder/seed.sh peers.txt
```
