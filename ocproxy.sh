#!/bin/sh

## Stolen and modified from https://acm.ecnu.edu.cn/blog/entry/173/

while getopts u:s:p: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
	s) passwordfile=${OPTARG};;
        p) socksport=${OPTARG};;
    esac
done

while true; do
	cat $passwordfile | openconnect --protocol=pulse --script-tun --script "ocproxy -D $socksport -g -k 15" -u $username --authgroup "NTU EMail Account" --passwd-on-stdin sslvpn2.ntu.edu.tw
    sleep 1
done
