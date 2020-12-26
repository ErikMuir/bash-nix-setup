#!/bin/bash

echo -n "Installing tools... "
jq --version > /dev/null 2>&1 || sudo apt install jq
echo "done."

echo -n "Configuring shell... "
# source functions first
source ./functions/.bashrc
for dir in */ ; do
  for file in $dir.* ; do
    [ -d "$file" ] || source "$file"
  done
done
echo "done."

