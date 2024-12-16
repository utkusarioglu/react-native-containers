#!/bin/bash

set -eu

git add .
git commit -m "$(date '+%H:%M:%S %Z')"
git push
