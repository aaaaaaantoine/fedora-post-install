# Guide post-install Fedora 42 Workstation

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

## H/W Video Acceleration
* Helps decrease load on the CPU when watching videos online by alloting the rendering to the dGPU/iGPU. Quite helpful in increasing battery backup on laptops.

### H/W Video Decoding with VA-API 
* `sudo dnf install ffmpeg-libs libva libva-utils`

<details>
<summary>Intel</summary>
 
* If you have a recent Intel chipset (5th Gen and above) after installing the packages above., Do:
```sh
sudo dnf swap libva-intel-media-driver intel-media-driver --allowerasing
sudo dnf install libva-intel-driver
```
</details>

<details>
<summary>AMD</summary>No need to do this for intel integrated graphics. Mesa drivers are for AMD graphics, who lost support for h264/h245 in the fedora repositories in f38 due to legal concerns.
 
* If you have an AMD chipset, after installing the packages above do:
```
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686
```
</details>


## Set Hostname
* `hostnamectl set-hostname Fedora`
