#!/bin/bash          
keyword=$1
echo "Sorting by "$keyword
mkdir "only_"$keyword
cp *$keyword".png" only_$keyword/
