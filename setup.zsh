#!/bin/zsh

vim_dir=${0:a:h}

# Create a symlink at location $1 with source $2. Backup $1 if it already
# exists.
backup-and-link() {
  [ -z "$2" ] && return 1

  if [ -e "$1" ]; then
    echo "Moved $1 -> $1.back"
    mv "$1" "$1".back
  fi

  ln -s "$2" "$1"
  echo "Symlinked $1 -> $2"
}

backup-and-link ~/.vim   "$vim_dir"
backup-and-link ~/.vimrc "$vim_dir"/vimrc

mkdir "$vim_dir"/backup
