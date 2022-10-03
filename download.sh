#!/bin/bash

cat packages.csv | while read line; do
	NAME="$(echo $line | cut -d\; -f1)"
	VERSION="$(echo $line | cut -d\; -f2)" 
	URL="$(echo $line | cut -d\; -f3 | sed "s/@/$VERSION/g")"
	MDSUM="$(echo $line | cut -d\; -f4)" 	
	CACHFILE="$(basename "$URL")"

	wget "$URL"
	if [ ! -f "$CACHFILE" ]; then
		if ! echo "$MDSUM $CACHFILE" | md5sum -c >/dev/null; then
			rm -rf "$CACHFILE"
			echo "Name = $NAME"
			echo "Version = $VERSION"
			echo "Url = $URL"
			echo "MD5 = $MDSUM"
			echo "CachEfile = $CACHFILE"
			echo "Verification Failed!"
		fi
	fi
done
