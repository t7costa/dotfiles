#!/usr/bin/env bash

function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.df.bak
    fi

    ln -sf ${source} ${target}
}

function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
        unlink ${target}
        mv $target.df.bak $target
    fi
}

if [ "$1" == "--restore" -o "$1" == "-r" ]; then
    # Restore all backed up files
    for i in _*
    do
        unlink_file $i
    done
else
    # Setup proper paths to all the resources
    for i in _*
    do
        link_file $i
    done

    # Make sure we are up to date
    git submodule update --init --recursive
    git submodule foreach --recursive git pull origin master

    if [ "$1" == "--update" -o "$1" == "-u" ]; then exit; fi

    # Build Command-T
    cd _vim/bundle/command-t/ruby/command-t/ && rake make

    # Set shell
    chsh -s `which zsh`
    /usr/bin/env zsh
    source ~/.zshrc
fi
