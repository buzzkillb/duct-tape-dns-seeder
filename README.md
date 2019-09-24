# duct-tape-dns-seeder  

### install python cloudflare  
```
sudo apt install python-pip
git clone https://github.com/cloudflare/python-cloudflare
cd python-cloudflare
./setup.py build
sudo ./setup.py install
```

### clone me  
```
cd ~
git clone https://github.com/buzzkillb/duct-tape-dns-seeder
```

### cloudflare.cfg  (update your email and api key after moving to ~/.cloudflare)
```
cd ~/duct-tape-dns-seeder
mkdir ~/.cloudflare
cp cloudflare.cfg.example ~/.cloudflare/cloudflare.cfg
```
### make the files executable  
```
cd ~/duct-tape-dns-seeder
chmod +x jq.sh seed.sh delete.py
```

### crontab -e
```
# update A records
0 * * * * /usr/local/bin/denariusd getpeerinfo > /root/duct-tape-dns-seeder/peer.json
1 * * * * /bin/sh /root/duct-tape-dns-seeder/jq.sh
2 * * * * cd /root/duct-tape-dns-seeder && /bin/sh /root/duct-tape-dns-seeder/seed.sh peers.txt
```
