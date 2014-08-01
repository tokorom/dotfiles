#!/bin/zsh

#####################################
echo '### command line tools'

xcode-select -p > /dev/null
if [ 0 -ne $? ]; then
  xcode-select --install
else
  echo 'SKIPPED'
fi

#####################################
echo '### dotfiles'

ls installer/installed > /dev/null
if [ 0 -ne $? ]; then
  workdir=dotfiles_tmp
  zipname=dotfiles.zip
  git clone https://github.com/tokorom/dotfiles $workdir
  ls $workdir
  if [ 0 -eq $? ]; then
    cd $workdir
    zip -r ../$zipname ./* ./.*
    cd
    unzip -o $zipname

    ls ~/.vim > /dev/null
    if [ 0 -ne $? ]; then
      ln -s ~/vimfiles ~/.vim
    fi

    mkdir backup

    rm $zipname
    rm -rf $workdir

    git submodule update -i
  else
    echo 'git clone is failed!' >&2
  fi
else
  git pull origin master
  git submodule update -i
fi

#####################################
echo '### homebrew'

which brew > /dev/null
if [ 0 -ne $? ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew bundle

#####################################
echo '### karabiner'

sh ~/karabiner-import.sh

#####################################
echo '### change login shell'

zshpath=/usr/local/bin/zsh

grep $zshpath /etc/shells > /dev/null
if [ 0 -ne $? ]; then
  sudo sh -c "echo $zshpath >> /etc/shells"
  chsh -s $zshpath
else
  echo 'SKIPPED'
fi

#####################################
echo '### firefox'

ls FireFox > /dev/null
if [ 0 -ne $? ]; then
  unzip FireFoxBackup.zip
  firefox=~/Applications/Firefox.app/Contents/MacOS/firefox
  which $firefox > /dev/null
  if [ 0 -eq $? ]; then
    echo 'Please select the profile directory ~/FireFox'
    $firefox -P
  fi
else
  echo 'SKIPPED'
fi

#####################################
echo '### addfiles'

addfiles=addfiles/addfiles.zip
ls $addfiles > /dev/null
if [ 0 -eq $? ]; then
  echo 'Hint: 4'
  unzip $addfiles
fi

# ===================================
echo '===== DONE ====='

