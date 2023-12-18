_install_script() {
    echo "Installing script dependencies"
    echo "Installing packages to use install script"

    read -p "Press enter to continue"

    if ! _installPackages ~/install/modules/install_dependecies/packages.txt; then
        echo "Error: Failed to install packages"
        return 1
    fi

    echo "Install AUR Helper"
    if command -v paru >/dev/null 2>&1; then
        echo "paru is already installed"
    else
        if [ -d "paru-bin" ]; then
            echo "paru-bin directory exists. Removing..."
            rm -rf paru-bin
        fi

        if ! git clone https://aur.archlinux.org/paru-bin.git; then
            echo "Error: Failed to clone repository"
            return 1
        fi

        cd paru-bin
        if ! makepkg -si; then
            echo "Error: Failed to make package"
            return 1
        fi
    fi

    cd ~/install
}

_install_script

