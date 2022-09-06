#!/bin/bash

bin_path=/usr/local/bin

cp ccache "$bin_path/"

for compiler in gcc g++ cc c++ clang clang++;
do
  ln -s ccache "$bin_path/$compiler"
done
