# Fedora 42 Workstation

Choses à faire après l'installation de Fedora 42

## RPM Fusion & Terra

* RPM Fusion:
```sh
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

* Terra:
```sh
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
```

## Mises à jour
* Accédez au centre de logiciels et cliquez sur <Mettre à jour>. Ou en ligne de commande:
* `sudo dnf update`
* Redémarrez.

## Logiciels

* Installation
```sh
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

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install eartag podcasts shortwave
```

* Déinstallation
```sh
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
```
