#!/bin/bash

bin_path=/usr/local/bin

cp ccache "$bin_path"

for compiler in gcc g++ cc c++ clang clang++;
do
  sudo rm -rf "$bin_path/$compiler"
  ln -s ccache "$bin_path/$compiler"
done
