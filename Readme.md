# Dotfiller
Yet another dotfile manager for Linux.

**Warning**: The master branch is not considered stable. If you wish to use Dotfiller, use the latest release. If there is no release, then it's still in development.

While Dotfiller has been tested, I wouldn't exactly consider it production-grade code, so use it at your own risk. I'm not responsible for things being deleted in your home directory or logs being broken.

## Dotfiller can

* Sync items in your home folder from Git or Dropbox
* Sync items between Git and Dropbox
* Be automated into a one-line command to set up your dotfiles and keep them up to date

## Why

When I'm on my machines at home, I want all my changes to my dotfiles to be sync'd and immediately reflected on all of my hosts.

When I'm on a machine that isn't mine (or is shared with others), I still want my dotfiles and I want them to be up to date - but I don't want that machine to have unfiltered access to my Dropbox.

## How to use

### Providers

There are only two providers currently supported: Git and Dropbox.
There is an additional install type called "Sync" that will regularly sync changes from Dropbox to Git.

### Using a bootstrap script

The bootstrap script will skip a lot of questions and allow you to get up and running quicker. The one in this repo is specific to my setup, so you may wish to create your own.

* Download a bootstrap script (Either the one in this repo or your own customised one)
* Run it
* If you're using the one in this repo, it will ask you if you wish to use Dropbox or Git
* If Dropbox, you will be asked to visit a link to complete login
* Done

Here's a list of the available environment variables to skip questions. If a variable is unset, it will prompt you for the answer. See `bootstrap.sh` for an example:

| Env Var                   | Possible Values                                               | Provider | Notes                                                                                                                                                                                         |
|---------------------------|---------------------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `OVERWRITE_ALL`           | `1` or unset                                                  |          | `1` will overwrite all files in the home directory that conflict with the ones from your provider, rather than prompting the user for each file                                               |
| `OVERWRITE_ALL_FOREVER`   | `1` or unset                                                  |          | `1` will overwrite all files in the home directory that conflict with the ones from your provider, plus any new files that appear in later runs, rather than prompting the user for each file |
| `SYNC_CHOICE`             | `cron` or `manual`                                            | Sync     | `cron` adds a line to your crontab to automatically sync changes from Dropbox to Git every hour.                                                                                              |
| `USER_GIT_REPO`           | A link to a repo containing your dotfiles                     | Git      |                                                                                                                                                                                               |
| `GIT_PROVIDER_UPDATE`     | `login` or `manual`                                           | Git      | `login` adds a line to your `~/.bashrc` to automatically pull updates to the repo on login.                                                                                                   |
| `SKIP_DROPBOX_EXCLUSIONS` | `y`, `n` or unset                                             | Dropbox  | If Dropbox is already installed, `y` will cause Dotfiller to not set up exclusions. `n` will set up exclusions. If unset, it will ask if it detects a Dropbox install.                        |
| `DROPBOX_DIR`             | The name of the _top level_ directory in Dropbox to sync from | Dropbox  |                                                                                                                                                                                               |
| `SYMLINK_NOW`             | `y` or unset                                                  |          | After setting up a provider, `y` will cause Dotfiller to immediately set up symlinks from your home dir to the provider path.                                                                 |
| `CREATE_LINKS_WHEN`       | `login` or `manual`                                           |          | `login` adds a line to your `~/.bashrc` to automatically check and fix/create symlinks from your home dir to the provider path                                                                |
| `INSTALL_TYPE`            | `dropbox`, `git` or `sync`                                    |          |                                                                                                                                                                                               |
To make this even easier, I have an `index.html` (crucially with the `add_header Content-Type text/plain;` Nginx directive) at `https://dotfiles.makeshift.ninja` containing:
```
source <(curl -s "https://raw.githubusercontent.com/Makeshift/dotfiller/master/bootstrap.sh" )
```

This allows me to type just `$(curl dotfiles.makeshift.ninja)` to get started.

### Running Dotfiller directly

* Download the Dotfiller script
* Run `./dotfiller install`