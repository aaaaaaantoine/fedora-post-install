<div align="center">
<h1 align="center">
<br>Fedora Post-Install
</h1>
<h3>Développé avec les logiciels et outils ci-dessous.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style&logo=Markdown&logoColor=white" alt="Markdown" />
</p>

<img src="https://img.shields.io/github/languages/top/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub top language" />
<img src="https://img.shields.io/github/languages/code-size/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub code size in bytes" />
<img src="https://img.shields.io/github/commit-activity/m/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/badge/License-GPL%20v3-yellow.svg?style&color=5D6D7E" alt="GitHub license" />
</div>

---

Choses à faire après l'installation de Fedora 42

## RPM Fusion & Terra

RPM Fusion:
* `sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

Terra:
* `sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release`

## Mises à jour
* Accédez au centre de logiciels et cliquez sur <Mettre à jour>. Ou en ligne de commande:
* `sudo dnf update`
* Redémarrez.
* 
## Installation
* `sudo dnf install abiword alacarte celluloid deja-dup epiphany gnome-music gnucash gnumeric kodi papers secrets virt-manager`

## Déinstallation
* `sudo dnf remove evince libreoffice-* firefox gnome-characters gnome-boxes gnome-font-viewer gnome-logs gnome-maps mediawriter ptyxis rhythmbox simple-scan snapshot totem`
