# dotfiles

## Setup for macOS

### dotfiles

```sh
git clone https://github.com/tokorom/dotfiles.git

cd dotfiles
mv .* *.* bin installer terminal backup ../ 
rm -r dotfiles

mkdir backup
```

### brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

```sh
brew update

brew install git
brew install tmux
brew install git-delta
brew install fzf
brew install gh
brew install gawk
brew install gsed
brew install python
brew install vim
```

### private.zip

```sh
brew install p7zip

7za x private.zip

echo "AddKeysToAgent yes
UseKeychain yes
" > .ssh/config
```

Need your zip password.

### Vim

```sh
git submodule update -i

vim
```

Would you like to install this plugin now? [y/n] => y

### Other Dev Apps

- http://www.hammerspoon.org/
- https://www.alfredapp.com/

