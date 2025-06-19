#!/bin/bash
set -x

q-aria2c \
    https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf.tar.xz
# wget \
#     q-aria2c https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf.tar.xz
tar -J -xvf arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf.tar.xz

mkdir -p ../compiler/
mv arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf/  ../compiler/prefix
