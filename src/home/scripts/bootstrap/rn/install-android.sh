#!/bin/bash

set -euxo pipefail
bash --version

ARGS=(
  android_home
  sdk_version
  android_build_version
  android_tools_version
  cmake_version
  ndk_version
)
. /home/dev/scripts/utils/parse-args.sh

curl -sS https://dl.google.com/android/repository/${sdk_version} -o /tmp/sdk.zip
mkdir -p ${android_home}/cmdline-tools
unzip -q -d ${android_home}/cmdline-tools /tmp/sdk.zip
mv ${android_home}/cmdline-tools/cmdline-tools ${android_home}/cmdline-tools/latest
rm /tmp/sdk.zip 

yes | sdkmanager --licenses
yes | sdkmanager "platform-tools" \
  "platforms;android-${android_build_version}" \
  "build-tools;${android_tools_version}" \
  "cmake;${cmake_version}" \
  "ndk;${ndk_version}" \
  || true

rm -rf ${android_home}/.android \

chmod 777 -R /opt/android
