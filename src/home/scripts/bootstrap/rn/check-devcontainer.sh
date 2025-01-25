#!/bin/bash

set -euxo pipefail
bash --version

required_packages="gh node nvim git yarn"

for exec in $required_packages;
do
  if [ -z "$(which $exec)" ];
  then
    echo "Error: $exec is not available inside the container"
    exit 1
  fi
done

node <<EOF
console.log("Node runs as expected");
EOF
