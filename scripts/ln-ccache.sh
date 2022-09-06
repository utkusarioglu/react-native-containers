#!/bin/bash

bin_path=/usr/local/bin
bashrc_path=/root/.bashrc

sudo /usr/sbin/update-ccache-symlinks

echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a "$bashrc_path"
