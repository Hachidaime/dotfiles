#!/bin/bash

let n=1
cat ~/.cache/bulk/bulknew |
	while read -r line; do
		sed -i "$n s|$| $line|g" ~/.cache/bulk/bulkold
		n=$(($n + 1))
	done

sed -i "s/^/mv -vi /g" ~/.cache/bulk/bulkold

~/.cache/bulk/bulkold
