### Setup
These are all my config files for vim, git, screen and zsh. To get set up on a new machine run ...

```bash
git clone https://github.com/t7costa/dotfiles.git && cd dotfiles && ./install.sh
```
Any file matching `_*` will be linked into `$HOME` as a symlink with the first `_`  replaced with a `.`

### Dependencies
```bash
sudo apt-get install zsh screen vim-nox git rake ruby1.9.1-dev yakuake

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```
