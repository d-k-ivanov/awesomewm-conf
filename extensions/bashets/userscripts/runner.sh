#!/bin/sh

while true; do
	echo "bashets.external_w(\"`$1 | sed '{:q;N;s/\n/\\\n/g;t q}'`\", \"$2\")" | awesome-client
	sleep $3
done
