#!/bin/bash

sudo bash -c 'cat << EOF > /etc/yum.repos.d/llvmtoolset-build.repo
[llvmtoolset-build]
name=LLVM Toolset 11.0 - Build
baseurl=https://buildlogs.centos.org/c7-llvm-toolset-11.0.x86_64/
gpgcheck=0
enabled=1
EOF'

sudo yum install --nogpgcheck llvm-toolset-11.0-clang-tools-extra llvm-toolset-11.0-clang llvm-toolset-11.0-lld.x86_64 llvm-toolset-11.0-llvm-devel.x86_64 devtoolset-11-gcc-c++.x86_64

# TODO
# source /opt/rh/llvm-toolset-11.0/enable
