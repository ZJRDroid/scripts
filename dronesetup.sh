#!/bin/bash
cd ..

git clone https://github.com/UtsavisGreat/AnyKernel3 -b master anykernel

if [[ "$@" =~ "clang"* ]]; then
	git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 --depth=1 gcc
	git clone https://github.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-5696680 --depth=1 clang
elif [[ "$@" =~ "dragon"* ]]; then
	wget https://github.com/kdrag0n/proton-clang-build/releases/download/20190803/proton_clang-20190803-c835164a.tar.zst && tar -I zstd -xvf proton_clang-20190803-c835164a.tar.zst && mv proton_clang-20190803-c835164a dragontc
else
	git clone https://github.com/kdrag0n/aarch64-elf-gcc -b 9.x --depth=1 gcc
	git clone https://github.com/kdrag0n/arm-eabi-gcc -b 9.x --depth=1 gcc32
fi
