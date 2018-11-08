#!/bin/bash
shopt -s dotglob

for f in ./dotfiles/*; do 
  name=${f##*/}
  echo "Processing ${name} .."; 
  ln -sfv "${HOME}/${name}" "./dotfiles"
done
