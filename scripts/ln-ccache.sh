#!/bin/bash

bin_path=/usr/bin

for compiler in gcc g++ cc c++ clang clang++;
do
  sudo rm -rf "$bin_path/$compiler"
  ln -s ccache "$bin_path/$compiler"
done
