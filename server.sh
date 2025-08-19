#!/bin/bash

## Upgrade
sudo dnf -y upgrade

## Libvirt Qemu/KVM
sudo dnf install -y cockpit-machines cockpit-podman
sudo usermod -aG libvirt $USER

## Install Software
sudo dnf install -y systemd-networkd

## hostname
sudo hostnamectl set-hostname fedoralab

exit 0
