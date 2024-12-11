#!/usr/bin/make -f

.PHONY: build install install_dep

PREFIX = /usr
BIMG=bimg

# 构建可执行文件
build:
	@amber main.ab bimg

# 安装一些必要的服务，如果需要在 x86 构建其他架构需要安装 qemu-user-static，并重启 systemd-binfmt 服务
install-dep:
	sudo apt install mmdebstrap qemu-user-static usrmerge gdisk binfmt-support dosfstools mtools
	sudo systemctl restart systemd-binfmt
