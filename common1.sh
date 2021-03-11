#!/bin/bash

Diy_n1() {
KERNEL_VERSION="5.4.101-flippy-54+o"
VERSION="5.4.101"
mkdir opt
chmod  -R 777 opt
tar -xzvf mk_openwrt_src_20210304.tar.gz -C opt
cp openwrt/bin/targets/armvirt/*/*.tar.gz opt/openwrt    
cd opt
mkdir imgs
chmod  -R 777 imgs
cd imgs
pathimg=$PWD
wget https://github.com/haohaoget/N1/releases/download/${VERSION}/Armbian_20.10_Aml-s9xxx_buster_${KERNEL_VERSION}.img.xz
unxz Armbian_20.10_Aml-s9xxx_buster_${KERNEL_VERSION}.img.xz
cd ../
cd openwrt
sed -i 's//opt/imgs/${pathimg}/g' mk_s905d_n1.sh
chmod +x mk_s905d_n1.sh
sudo ./mk_s905d_n1.sh
sleep 20
sudo chmod  -R 777 tmp

}
