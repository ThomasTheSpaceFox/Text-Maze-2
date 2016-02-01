#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
#xaxis=$1
#yaxis=$2
#file=$3
#xaxis=2
#yaxis=5
#file=sample.MOD.txt
xaxis=$(sed '1q;d' lookup.txt)
yaxis=$(sed '2q;d' lookup.txt)
file=$(sed '3q;d' lookup.txt)
line=$(sed ''$yaxis'q;d' $file)
LINECACHE2=$(echo "$line" | grep -o .)
OUT=$(echo "$LINECACHE2" | sed ''$xaxis'q;d')
echo "$OUT"