#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/cf-seeder
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' "${1:?}" |
while read IP
do
    echo "$IP"
    cli4 --post name="dnsseed" type="A" content="$IP" /zones/:denarius.guide/dns_records
done
