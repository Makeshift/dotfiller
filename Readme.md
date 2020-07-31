# Dotfiller
Yet another dotfile manager for Linux.

**Dotfiller can:**

* Sync items in your home folder from Git or Dropbox
* Sync items between Git and Dropbox

**Why:** 

When I'm on my machines at home, I want all my changes to my dotfiles to be sync'd and immediately reflected on all of my hosts.

When I'm on a machine that isn't mine (or is shared with others), I still want my dotfiles and I want them to be up to date - but I don't want that machine to have unfiltered access to my Dropbox.

**What I am trying to achieve:**

I would like to be able to run a single command, be asked a few simple questions about the environment I'm on, and have my dotfiles available.

If the environment is considered safe (by me, the one running the command), then all changes to dotfiles on this machine will be synchronised to other machines via Dropbox, and updated into Git periodically.

If the environment is not considered safe, then changes will be pulled regularly from Git, and will _not_ be pushed back upstream if changed locally.