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
