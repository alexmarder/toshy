#!/usr/bin/env bash


# "Install" the Toshy dekstop entry files so that app launchers and menus can 
# "see" them and launch them.

# Check if the script is being run as root
if [[ $EUID -eq 0 ]]; then
    echo "This script must not be run as root"
    exit 1
fi

# Check if $USER and $HOME environment variables are not empty
if [[ -z $USER ]] || [[ -z $HOME ]]; then
    echo "\$USER and/or \$HOME environment variables are not set. We need them."
    exit 1
fi


echo -e "\nInstalling Toshy GUI and Tray app launchers..."

mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/share/icons"

cp -f "$HOME/.config/toshy/desktop/Toshy_GUI.desktop" "$HOME/.local/share/applications"
cp -f "$HOME/.config/toshy/desktop/Toshy_Tray.desktop" "$HOME/.local/share/applications"
cp -f "$HOME/.config/toshy/assets/toshy_app_icon_rainbow.svg" "$HOME/.local/share/icons"


echo -e "\nFinished installing Toshy GUI and Tray app launchers:"
echo ""
echo "- Toshy Preferences"
echo "- Toshy Tray Icon"
echo ""
echo "The applications should appear quickly in most app launchers."
echo ""