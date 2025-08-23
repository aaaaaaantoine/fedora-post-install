# Guide Fedora

## Lancer le script

* Fedora KDE personnalisé.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/fedora-post-install/main/kde.sh)" 
```

* Fedora Workstation personnalisé.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/fedora-post-install/main/workstation.sh)" 
```

* Fedora Server prêt à l'emploi.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/fedora-post-install/main/server.sh)" 
```

---

## Pont réseau pour vos VM avec systemd-networkd
1) Si vous utilisez un gestionnaire de réseau tel que Network Manager, désactiver le.
```sh
sudo systemctl disable --now NetworkManager
```

2) Lancez le service systemd:
```sh
sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd
```

3) Fichiers de configuration:

```sh
sudo nano /etc/systemd/network/10-br0.netdev
```
```sh
[NetDev]
Name=br0
Kind=bridge
```
```sh
sudo nano /etc/systemd/network/10-br0.network
```
```sh
[Match]
Name=br0

[Network]
Address=192.168.1.50/24
Gateway=192.168.1.1
DNS=192.168.1.1
```

```sh
sudo nano /etc/systemd/network/20-eth0.network
```

```sh
[Match]
Name=enp1s0

[Network]
Bridge=br0
```

4) En fin, redémarrez le service:

```sh
sudo systemctl restart systemd-networkd
```

5) Vérifiez que la configuration fonctionne bien
```sh
networkctl status
```

---

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
