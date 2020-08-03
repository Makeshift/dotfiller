#!/bin/bash
# This is an example bootstrap script that skips a lot of the questions that Dotfiller asks you upon installation.
# You should copy this script and customise it to your liking, then host it somewhere you can easily grab.
# I put mine on a webserver where I can just curl it, then run it to set up Dotfiller.

OVERWRITE_ALL=1
SYNC_CHOICE=cron
USER_GIT_REPO=https://github.com/Makeshift/dotfiles
GIT_PROVIDER_UPDATE=login
DROPBOX_DIR=homedir
SYMLINK_NOW=y
CREATE_LINKS_WHEN=login

mkdir -p "$HOME/.dotfiller"
