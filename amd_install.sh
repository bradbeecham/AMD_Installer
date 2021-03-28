#!/bin/bash
#Script for the easy installation of AMD Drivers on HiveOS/Ubuntu based OS
#Script By CryptoLuigi (Michael Ruperto)
#Date: 2019-04-21
#Contributors: miabo Cryptonuffe

systemctl stop hivex
miner stop

echo
#mkdir /hive-drivers-pack/
cd /hive-drivers-pack/
PS3='Please enter your choice Drivers: '

options=("16.40-348864-ubuntu-16.04" "20.50-1234663-ubuntu-18.04" "Quit")

select opt in "${options[@]}"
do
case $opt in
    "16.40-348864-ubuntu-16.04")
    wget http://download.hiveos.farm/drivers/amdgpu-pro-16.40-348864.tar.xz
        version="16.40-348864";break
    ;;
    "20.50-1234663-ubuntu-18.04")
	wget https://drivers.amd.com/drivers/linux/amdgpu-pro-20.50-1234663-ubuntu-18.04.tar.xz
        version="16.60-379184";break
    ;;
	"Quit")
	exit
        break
    ;;
    *)
        echo "Invalid option $REPLY"
    ;;
    esac
done

echo

tar -Jxvf amdgpu-pro-$version.tar.xz
cd amdgpu-pro-$version
./amdgpu-pro-install -y
dpkg -l amdgpu-pro
