# Guide Fedora

## Processus de mise à niveau

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
