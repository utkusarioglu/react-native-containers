#!/bin/bash

set -eu

test_num=17
tag=35-23-ubuntu-test-
image=utkusarioglu/react-native-android-devcontainer:${tag}

docker image rm ${image}$((test_num - 1)) || true
docker run -it --rm ${image}${test_num}
