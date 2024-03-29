# duct-tape-dns-seeder  

## Requirements
```
coin daemon (denariusd)
python-cloudflare
cloudflare acount
name hosting service that can point to cloudflare
```

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
### edit seed.sh
```
name="bseed" (name of seeder address)
/zones/:denarius.guide/dns_records (domain name)
```

### crontab -e
```
# update A records
0 8 * * * /usr/local/bin/denariusd getpeerinfo > /root/duct-tape-dns-seeder/peer.json
1 8 * * * /bin/sh /root/duct-tape-dns-seeder/jq.sh
2 8 * * * cd /root/duct-tape-dns-seeder && /bin/sh /root/duct-tape-dns-seeder/seed.sh peers.txt
# delete A records
40 0 * * WED /usr/bin/python /root/duct-tape-dns-seeder/delete.py denarius.guide bseed
45 0 * * WED /usr/bin/python /root/duct-tape-dns-seeder/delete.py denarius.guide bseed
50 0 * * WED /usr/bin/python /root/duct-tape-dns-seeder/delete.py denarius.guide bseed
55 0 * * WED /usr/bin/python /root/duct-tape-dns-seeder/delete.py denarius.guide bseed
```
