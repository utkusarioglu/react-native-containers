#!/bin/bash

set -eu

tag=35-23-ubuntu-test-16
image=utkusarioglu/react-native-android-devcontainer:${tag}

docker image rm $image || true
docker run -it --rm $image
