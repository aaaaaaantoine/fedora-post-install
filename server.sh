#!/bin/bash

## Upgrade
sudo dnf -y upgrade

## Libvirt Qemu/KVM
sudo dnf install -y cockpit-machines cockpit-podman libvirt pcp python3-pcp
sudo usermod -aG libvirt $USER
sudo systemctl enable --now libvirtd

## Install Software
sudo dnf install -y systemd-networkd

## hostname
sudo hostnamectl set-hostname fedoralab

exit 0
