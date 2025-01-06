#!/usr/bin/make -f

.PHONY: build install install_dep

PREFIX = /usr
BIMG=bimg
# 检测系统架构
ARCH := $(shell uname -m)

# 构建可执行文件
build:
	@amber build main.ab bimg

# 安装一些必要的服务，如果需要在 x86 构建其他架构需要安装 qemu-user-static，并重启 systemd-binfmt 服务
# arm 安装 grub grub-efi-arm64-bin

install-dep:
ifeq ($(ARCH),x86_64)
	@echo "Install depends for x86_64..."
	sudo apt install mmdebstrap qemu-user-static usrmerge gdisk binfmt-support dosfstools mtools \
    squashfs-tools xorriso isolinux syslinux-efi grub-pc-bin grub-efi-amd64-bin
	sudo systemctl restart systemd-binfmt
else ifeq ($(ARCH),aarch64)
	@echo "Install depends for ARM64..."
	sudo apt install mmdebstrap qemu-user-static usrmerge gdisk binfmt-support dosfstools mtools \
    squashfs-tools xorriso isolinux syslinux-efi grub-efi-arm64-bin
else
	@echo "Unsupported architecture: $(ARCH)"
endif
