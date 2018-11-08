#!/bin/bash
shopt -s dotglob

dir="${HOME}/dotfiles/dotfiles/"

for f in ./dotfiles/*; do 
  name=${f##*/}
  echo "Processing ${name} .."; 
  ln -sfv "${dir}$f"  "${HOME}"
done
