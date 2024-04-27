#!/bin/bash

#./x build --stage 2 --target x86_64-unknown-linux-gnu
#./x build --target x86_64-pc-windows-gnu

export PATH=/usr/local/osx-ndk-x86/bin:$(pwd):${PATH}
export LD_LIBRARY_PATH=/usr/local/osx-ndk-x86/lib

#ln -sf $(which x86_64-apple-darwin20.4-cc) x86_64-apple-darwin20.4-cc
#ln -sf x86_64-apple-darwin20.4-cc cc

#rm -f cc
#cat > ./cc <<EOF
##!/bin/bash
#PATH=/usr/local/osx-ndk-x86/bin:\${PATH} LD_LIBRARY_PATH=/usr/local/osx-ndk-x86/lib x86_64-apple-darwin20.4-cc \$@
#EOF
#chmod a+x ./cc

#+
#export CC_x86_64_apple_darwin=x86_64-apple-darwin20.4-cc
#./x build --stage 2 --target x86_64-apple-darwin

#+
#export CC_aarch64_apple_darwin=aarch64-apple-darwin20.4-cc
#./x build --stage 2 --target aarch64-apple-darwin

#export CC_x86_64_pc_windows_gnu=x86_64-w64-mingw32-gcc
#./x build --stage 2 --target x86_64-pc-windows-gnu

#export CC=o64-clang
#export CXX=o64-clang++

#export TARGET=x86_64-apple-darwin
#export CFLAGS='-arch x86_64 -O2'
#export CC=x86_64-apple-darwin20.4-cc
#export CC_x86_64_apple_darwin=o64-clang

#export CXX=x86_64-apple-darwin20.4-c++
#export AR=x86_64-apple-darwin20.4-ar
#export AS=x86_64-apple-darwin20.4-cc
#export LD=x86_64-apple-darwin20.4-ld
#export PKG_CONFIG_ALLOW_CROSS=1

export CC_x86_64_apple_darwin=x86_64-apple-darwin20.4-cc
export CC_aarch64_apple_darwin=aarch64-apple-darwin20.4-cc
export CC_x86_64_pc_windows_gnu=x86_64-w64-mingw32-gcc
./x build --stage 2 --target x86_64-unknown-linux-gnu,x86_64-apple-darwin,aarch64-apple-darwin,x86_64-pc-windows-gnu


#,x86_64-apple-darwin,x86_64-pc-windows-gnu

