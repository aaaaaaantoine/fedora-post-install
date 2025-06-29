# Guide Fedora Workstation

Choses à faire après l'installation de Fedora Workstation Édition

### RPM Fusion

* RPM Fusion:
```sh
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Mises à jour
* Accédez au centre de logiciels et cliquez sur "Mettre à jour". Ou en ligne de commande:
* `sudo dnf update`
* Redémarrez.

### Logiciels

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

### Media Codecs

```sh
sudo dnf4 group install multimedia
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf upgrade @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video 
```

* H/W Décodage Vidéo via VA-API

```sh
sudo dnf install ffmpeg-libs libva libva-utils
```

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

### QEMU/KVM
```
sudo dnf install -y virt-manager
sudo usermod -a -G libvirt antoine
```

### Fixer un nom d'hôte

```sh
hostnamectl set-hostname fedora-ws
````

### Résolution GDM
* Si comme moi vous avez un écran qui affiche une mauvaise qualité d'image, reconnu de base en 1080p mais que vous étes 'obligé' de réduire en 720p (ou autre) ? Alors faites ceci pour que lors de la connection GDM suive :

```sh
sudo cp -f ~/.config/monitors.xml ~gdm/.config/monitors.xml
sudo chown $(id -u gdm):$(id -g gdm) ~gdm/.config/monitors.xml
sudo restorecon ~gdm/.config/monitors.xml
sudo reboot
``` 

---

# Processus de mise à niveau

### Mettre à jour les paquets actuels :
```sh
sudo dnf upgrade --refresh
```


### Installer le plugin DNF de mise à niveau du système : 
```sh
sudo dnf install -y dnf-plugin-system-upgrade
```


### Télécharger la nouvelle version de Fedora :
```sh
sudo dnf system-upgrade download --releasever=43

• En cas de problème de résolution de dépendance :
sudo dnf system-upgrade download --releasever=43 --allowerasing
```


### Démarrer la mise à niveau :
```sh
sudo dnf system-upgrade reboot
```


### Nettoyage (facultatif) :
```sh
sudo dnf autoremove
```
