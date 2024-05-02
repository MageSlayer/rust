#!/bin/bash

# Local Rust compilers build script

set -e

export PATH=/usr/local/osx-ndk-x86/bin:$(pwd):${PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/osx-ndk-x86/lib

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HOME}/rust/build/x86_64-unknown-linux-gnu/stage0-sysroot/lib/rustlib/x86_64-unknown-linux-gnu/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/rh/devtoolset-11/root/usr/lib/gcc/x86_64-redhat-linux/11
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/llvm-11/lib


export CC_x86_64_unknown_linux_gnu=clang
export CXX_x86_64_unknown_linux_gnu=clang++

export CC_x86_64_apple_darwin=x86_64-apple-darwin20.4-cc
export CC_aarch64_apple_darwin=aarch64-apple-darwin20.4-cc
export CC_x86_64_pc_windows_gnu=x86_64-w64-mingw32-gcc

function sanitizers() {
    # move sanitizers in place, only Linux support
    # otherwise following error occurs
    # note: cc: error: {$HOME}/rust/build/x86_64-unknown-linux-gnu/stage2/lib/rustlib/x86_64-unknown-linux-gnu/lib/librustc-dev_rt.lsan.a: No such file or directory

    pushd build/x86_64-unknown-linux-gnu
    cp -f native/sanitizers/build/lib/linux/*  stage2/lib/rustlib/x86_64-unknown-linux-gnu/lib/
    popd
}

H=$(hostname)
if [[ "$H" != "builderust.dev.ath" ]]; then
    # non-split build
    ./x build --stage 2 --target x86_64-unknown-linux-gnu,x86_64-apple-darwin,aarch64-apple-darwin,x86_64-pc-windows-gnu
    sanitizers
else
    # split compilation
    . /etc/os-release
    if [[ "devuan" == "$ID" ]]; then
	# chrooted build
	echo "CHROOT"
	#export PATH=${HOME}/rust/build/x86_64-unknown-linux-gnu/llvm/bin:${PATH}
	./x build --stage 2 --target x86_64-apple-darwin,aarch64-apple-darwin,x86_64-pc-windows-gnu
    else
	# main build
	./x build --stage 2 --target x86_64-unknown-linux-gnu
	sanitizers
    fi
fi


