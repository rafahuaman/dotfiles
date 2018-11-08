#!/bin/bash
shopt -s dotglob

for f in ./dotfiles/*; do 
  name=${f##*/}
  echo "Processing ${name} .."; 
  ln -sfv "$f"  "${HOME}"
done
