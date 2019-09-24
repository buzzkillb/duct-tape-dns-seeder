#!/bin/sh
jq '.[] | .addr' -r /root/duct-tape-dns-seeder/peer.json > /root/duct-tape-dns-seeder/peers.txt
