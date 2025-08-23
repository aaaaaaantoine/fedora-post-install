#!/bin/bash
# Fedora Workstation

# RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install
sudo dnf install -y \
abiword \
alacarte \
celluloid \
deja-dup \
epiphany \
geary \
gnome-builder \
gnome-music \
gnucash \
gnumeric \
kodi \
papers \
secrets \
virt-manager

# flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install eartag podcasts shortwave

# remove
sudo dnf remove -y \
evince \
libreoffice-* \
firefox \
gnome-characters \
gnome-boxes \
gnome-font-viewer \
gnome-logs \
gnome-maps \
mediawriter \
ptyxis \
rhythmbox \
simple-scan \
snapshot \
totem

# media codecs
sudo dnf4 group install multimedia
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf upgrade @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video

# H/W Décodage Vidéo via VA-API
sudo dnf install ffmpeg-libs libva libva-utils
sudo dnf swap libva-intel-media-driver intel-media-driver --allowerasing
sudo dnf install libva-intel-driver

# qemu/kvm
sudo dnf install -y virt-manager
sudo usermod -a -G libvirt $USER

# hostnamectl
hostnamectl set-hostname fedora-ws

# gdm
sudo cp -f ~/.config/monitors.xml ~gdm/.config/monitors.xml
sudo chown $(id -u gdm):$(id -g gdm) ~gdm/.config/monitors.xml
sudo restorecon ~gdm/.config/monitors.xml

echo "sudo reboot"
exit0
