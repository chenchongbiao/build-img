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

## 参数

- --base-type 可选参数 [minimal, desktop]
- -n,--name 必选参数，指定发行版名称
- -d,--distro 必须参数，指定发行版代号
- -c,--components 必选参数，软件源分类（如 deb https://community-packages.deepin.com/beige/ beige main commercial community 分类有三个 main,commercial,community)
- -a,--arch 必选参数，指定系统架构 [amd64,arm64,loong64,riscv64]
- -s,--sources 必选参数，指定软件源 （如 deb https://community-packages.deepin.com/beige/ beige main commercial community, 多个源使用逗号分隔)
- --device 必选参数，指定设备 qemu 或者板子型号
- --image-size 可选参数，指定创建的磁盘镜像大小

## 构建磁盘镜像

### amd64

```bash
./bimg build board -n "deepin" -d "beige" -c "main,commercial,community" -a "amd64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community,deb https://proposed-packages.deepin.com/beige-testing/ unstable/25 main commercial community" --device qemu
```

### arm64

#### qemu

```bash
./bimg build board -n "deepin" -d "beige" -c "main,commercial,community" -a "arm64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community" --device qemu
```

#### rock-5b

```bash
./bimg build board -n "deepin" -d "beige" -c "main,commercial,community" -a "arm64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community,deb https://proposed-packages.deepin.com/beige-testing/ unstable/25 main commercial community" --device rock-5b
```

#### RDK X5

```bash
./bimg build board -n "deepin" -d "beige" -c "main,commercial,community" -a "arm64" -s "deb https://community-packages.deepin.com/beige/ beige main commercial community,deb https://proposed-packages.deepin.com/beige-testing/ unstable/25 main commercial community" --device rdk-x5
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
