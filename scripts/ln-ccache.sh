#!/bin/bash

bin_path=/usr/local/bin

cp /usr/bin/ccache "$bin_path/ccache"

for compiler in gcc g++ cc c++ clang clang++;
do
  compiler_path="$bin_path/$compiler"
  ln -sf ccache $compiler_path
  echo "Linked ccache to $compiler_path"
done
