#!/bin/zsh

for mmdfile in ./src/slide/images/*.mmd
do
  echo "converting ${mmdfile} -> ${mmdfile:0:-4}.svg"
  ./node_modules/.bin/mmdc -i $mmdfile -o ${mmdfile:0:-4}.svg
done
