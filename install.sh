#!/bin/bash

zshrc() {
    echo "==========================================================="
    echo "             cloning zsh-autosuggestions                   "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "==========================================================="
    echo "                    cloning roverform                      "
    echo "-----------------------------------------------------------"
    git clone https://github.com/roverdotcom/roverform.git $HOME/roverform

    echo "==========================================================="
    echo "                   installing roverform                    "
    echo "-----------------------------------------------------------"
    sudo ln -s $HOME/roverform/bin/roverform /usr/local/bin/roverform

    echo "==========================================================="
    echo "                  Import zshrc                             "
    echo "-----------------------------------------------------------"
    cp .zshrc $HOME/.zshrc
}

zshrc

cp .jackrc $HOME/.jackrc
echo "source $HOME/.jackrc" >> $HOME/.bashrc