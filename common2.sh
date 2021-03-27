#!/bin/bash

Diy_n1() {
KERNEL_VERSION="5.4.108-flippy-56+o"
VERSION="5.4.108"
mkdir opt
chmod  -R 777 opt
tar -xzvf mk_openwrt_src_20210327.tar.gz -C opt
cp openwrt/bin/targets/armvirt/*/*.tar.gz opt/openwrt    
cd opt
mkdir imgs
chmod  -R 777 imgs
echo "PATH2=${GITHUB_WORKSPACE}/opt/imgs" >> $GITHUB_ENV
cd imgs
pathimg=$PWD
wget https://github.com/1980Add/N1/releases/download/${VERSION}/Armbian_20.10_Aml-s9xxx_buster_${KERNEL_VERSION}.img.xz
unxz Armbian_20.10_Aml-s9xxx_buster_${KERNEL_VERSION}.img.xz
cd ../
cd openwrt
sed -i "s%/opt/imgs%${pathimg}%g" mk_s905d_n1.sh
chmod +x mk_s905d_n1.sh
sudo ./mk_s905d_n1.sh
sleep 20
sudo chmod  -R 777 tmp
ls
}
