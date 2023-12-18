Echo "Installing script dependenices"
echo "Installing packages to use install script"

_installPackages ~/install/modules/install_dependecies/packages.txt

echo "Install AUR Helper" 
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ~/install
