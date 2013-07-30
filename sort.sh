#!/bin/bash

keyword=$1 #get the key word from the command line
echo "Sorting by "$keyword
mkdir only_$keyword
mv *$keyword* only_$keyword/
