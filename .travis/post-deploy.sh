#!/bin/bash
echo "checkout gh-pages branch"
git clone https://github.com/aliokan/hexMachina.git ~/hexMachina
cd ~/hexMachina
git checkout gh-pages
echo "updpate downloads.yml content."
cd $HOME
node .travis/update-download-list.js ~/hexMachina
echo "commit change."
cd ~/hexMachina
git status
git commit -m "update downloads.yml"
git push
echo "is pushed."
