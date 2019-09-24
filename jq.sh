#!/bin/sh
jq '.[] | .addr' -r /root/duct-tape-dns-seeder/peer.json | sed 's/.*\[\([^]]*\)\].*/\1/g' > /root/duct-tape-dns-seeder/peers.txt
