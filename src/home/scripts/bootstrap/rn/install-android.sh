#!/bin/bash

# Notice that this doesn't have `-o pipefail`
# See #1 below for why
set -eux
bash --version

ARGS=(
  android_home
  sdk_version
  android_platform_version
  android_build_tools_version
  cmake_version
  ndk_version
)
. /home/dev/scripts/utils/parse-args.sh

curl -sS https://dl.google.com/android/repository/${sdk_version} -o /tmp/sdk.zip
mkdir -p ${android_home}/cmdline-tools
unzip -q -d ${android_home}/cmdline-tools /tmp/sdk.zip
mv ${android_home}/cmdline-tools/cmdline-tools ${android_home}/cmdline-tools/latest
rm /tmp/sdk.zip 

# List available packages for future upgrades
sdkmanager --list

# #1 Either of these two fails with `set -o pipefail`
yes | sdkmanager --licenses
yes | sdkmanager "platform-tools" \
  "platforms;android-${android_platform_version}" \
  "build-tools;${android_build_tools_version}" \
  "cmake;${cmake_version}" \
  "ndk;${ndk_version}"

rm -rf ${android_home}/.android \

chmod 777 -R /opt/android
