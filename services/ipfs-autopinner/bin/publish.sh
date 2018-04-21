#!/bin/sh
## This silly little script replicates a file path into IPFS and pins the files
##
##
IPFS=$(nslookup ipfs| sed -n '$!d { s/Address[^:]*: \(.*\?\) .*/\1/p }')
IPFS="ipfs --api=/ip4/$IPFS/tcp/5001 "
echo "Using $IPFS"
HASH=$($IPFS add  --pin=true -r "$1" | sed '$!d' | awk '{print $2}')
echo "publishing \"$1\" (https://ipfs.io/ipfs/$HASH)"
PEERID=$($IPFS name publish "$HASH" | sed -n 's/.*Published to \([^:]*\).*/\1/p')
echo "published to https://ipfs.io/ipns/$PEERID"
