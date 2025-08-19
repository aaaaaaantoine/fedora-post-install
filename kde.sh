#!/bin/bash

## RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## Upgrade
sudo dnf -y upgrade

## Media Codecs
sudo dnf4 group install multimedia
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf upgrade @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video

## Libvirt/Qemu
sudo dnf install -y virt-manager
sudo usermod -a -G libvirt $USER

## Install Software
sudo dnf install -y kodi

## hostname
sudo hostnamectl set-hostname fedora-kde

## Intel Video
sudo dnf swap libva-intel-media-driver intel-media-driver --allowerasing
sudo dnf install -y libva-intel-driver

exit 0
