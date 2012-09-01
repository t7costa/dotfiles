#!/bin/sh

function doIt() {
    cd ~/dotfiles/

    # Make sure we are up to date
    git pull
    git submodule init
    git submodule update

    # Build Command-T
    cd ~/dotfiles/vim/bundle/command-t/ruby/command-t/ && ruby extconf.rb && make

    # Setup proper paths to all the resources
    rm -f ~/.vimrc && ln -s ~/dotfiles/vim/vimrc ~/.vimrc &&
    rm -f ~/.gvimrc && ln -s ~/dotfiles/vim/gvimrc ~/.gvimrc && 
    rm -f ~/.bash_profile && ln -s ~/dotfiles/bash/bash_profile ~/.bash_profile &&
    rm -f ~/.bashrc && ln -s ~/dotfiles/bash/bashrc ~/.bashrc &&
    rm -f ~/.bash_prompt && ln -s ~/dotfiles/bash/bash_prompt ~/.bash_prompt && 
    rm -f ~/.gitconfig && ln -s ~/dotfiles/gitconfig ~/.gitconfig && 
    rm -rf ~/.vim/ ln -s ~/dotfiles/vim/ ~/.vim

    cd ~/dotfiles/
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "**** WARNING: This will delete vim/bash/git config files in your home directory and overwrite them. **** Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
