FROM ipfs/go-ipfs:latest

ADD ./bin/publish.sh /publish.sh

ENTRYPOINT watch -n 300 /publish.sh /export
