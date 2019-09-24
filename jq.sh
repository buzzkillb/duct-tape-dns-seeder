#!/bin/sh
jq '.[] | .addr' -r /root/cf-seeder/peer.json > /root/cf-seeder/peers.txt
