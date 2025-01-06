# 介绍

# 构建

安装 Amber 环境

```bash
bash <(curl -s "https://raw.githubusercontent.com/amber-lang/amber/master/setup/install.sh")
```

构建脚本

```bash
git clone --depth=1 git@github.com:chenchongbiao/build-img.git
cd build-img
make
```

# 使用

## 构建磁盘镜像

### arm64

#### qemu

```bash
./bimg build board -n "deepin" -d "beige" -c "main,commercial,community" -a "arm64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community" --device qemu
```

#### rock-5b

```bash
./bimg build board -n "deepin" -d "beige" -c "main,commercial,community" -a "arm64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community" --device rock-5b
```

## 构建 livecd 镜像

### amd64

#### qemu

```bash
./bimg build livecd -n "deepin" -d "beige" -c "main,commercial,community" -a "amd64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community" --device qemu
```

启动命令

```bash
qemu-system-x86_64 -enable-kvm -cpu host -m 4096 -cdrom output/deepin-custom-amd64.iso
```

### arm64

#### qemu

```bash
./bimg build livecd -n "deepin" -d "beige" -c "main,commercial,community" -a "arm64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community" --device qemu
```

启动命令

```bash
qemu-system-aarch64 -cpu cortex-a7 -M virt -m 4096 -cdrom output/deepin-custom-arm64.iso
```
