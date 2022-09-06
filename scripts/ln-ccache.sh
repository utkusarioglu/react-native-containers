#!/bin/bash

bin_path=/usr/local/bin

for compiler in gcc g++ cc c++ clang clang++;
do
  compiler_path="$bin_path/$compiler"
  ln -s ccache $compiler_path
  echo "Linked ccache to $compiler_path"
done
