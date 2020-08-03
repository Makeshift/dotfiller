#!/bin/bash
# This is an example bootstrap script that skips a lot of the questions that Dotfiller asks you upon installation.
# You should copy this script and customise it to your liking, then host it somewhere you can easily grab.
# I put mine on a webserver where I can just curl it, then run it to set up Dotfiller.

mkdir -p "$HOME/.dotfiller/bin"

curl -s https://api.github.com/repos/Makeshift/dotfiller/releases/latest \
| /bin/grep "zipball_url" \
| cut -d : -f 2,3 \
| tr -d ,\" \
| xargs -I % curl -L -s -o "$HOME/.dotfiller/bin/dotfiller.zip" %

#unzip -o -j "$HOME/.dotfiller/bin/dotfiller.zip" -d "$HOME/.dotfiller/bin/" > /dev/null
rm "$HOME/.dotfiller/bin/dotfiller.zip" "$HOME/.dotfiller/bin/Readme.md"

# There are likely cleaner ways to do this, but it works!
OVERWRITE_ALL=1 \
SYNC_CHOICE=cron \
USER_GIT_REPO=https://github.com/Makeshift/dotfiles \
GIT_PROVIDER_UPDATE=login \
DROPBOX_DIR=homedir \
SYMLINK_NOW=y \
CREATE_LINKS_WHEN=login \
"$HOME/.dotfiller/bin/dotfiller" install