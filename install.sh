#!/bin/bash

apt update && apt dist-upgrade -y
dconf dump / > GNOME-Default-Settings.dconf
apt install gnome-tweaks gnome-extensions-app git curls rsync
mkdir ~/.themes

unzip ./items/Everforest-GTK-Theme.zip -d ~/.themes

ln -s ~/.themes/Everforest-Dark-BL-MOD/gtk-4.0/assets/ ~/.config/gtk-4.0
ln -s ~/.themes/Everforest-Dark-BL-MOD/gtk-4.0/gtk.css ~/.config/gtk-4.0
ln -s ~/.themes/Everforest-Dark-BL-MOD/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0

apt install flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install	flathub com.github.tchx84.Flatseal

flatpak override --filesystem=xdg-config/gtk-4.0

flatpak override --filesystem=$HOME/.themes

flatpak override --filesystem=$HOME/.local/share/icons

mkdir $HOME/.local/share/icons

unzip ./items/Papirus-everforest-icons.zip -d $HOME/.local/share/icons
unzip ./items/Sevi-green-everforest-icons.zip -d $HOME/.local/share/icons

mkdir $HOME/.icons
unzip ./items/Sukito-R-Everforest.zip -d $HOME/.icons
unzip ./items/Downloads/Sukito-S-Everforest.zip -d $HOME/.icons

unzip ./items/font-packs.zip -d ./items/
rsync -av ./items/font-packs/.local $HOME

unzip ./items/wallpapers.zip -d ./items/
rsync -av ./items/wallpapers/ /

unzip ./items/gnome-extensions.zip -d ./items/
rsync -av ./items/gnome-extensions/.local ~

unzip ./items/gnome-config.zip -d ./items/
cd ./items/gnome-config

dconf load /org/gnome/desktop/ < org.gnome.desktop.dconf
dconf load /org/gnome/shell/ < org.gnome.shell.dconf

apt install conky-all jq curl -y

unzip ./items/conky-config.zip -d ./items
rsync -av ./items/conky-config/.config ~
