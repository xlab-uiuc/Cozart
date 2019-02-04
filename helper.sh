#!/bin/bash -e
workdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
qemudir="$workdir/qemu"
qemubin="$qemudir/x86_64-softmmu/qemu-system-x86_64"

install-qemu() {
    git clone --depth 1 -b stable-2.12 https://github.com/qemu/qemu.git $qemudir
    cd $qemudir || exit 1;
    git submodule init;
    git submodule update --recursive;
    git apply -v "$workdir/patches/cpu-exec.patch";
    git apply -v "$workdir/patches/trace-events.patch";
    ./configure --enable-trace-backend=log --target-list=x86_64-softmmu;
    make -j8;
}
