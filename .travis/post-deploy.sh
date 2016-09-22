#!/bin/bash
echo "checkout gh-pages branch"
git clone https://github.com/aliokan/hexMachina.git ~/hexMachina
cd ~/hexMachina
git checkout gh-pages
echo "updpate downloads.yml content."
node $TRAVIS_BUILD_DIR/.travis/update-download-list.js ~/hexMachina
echo "commit change."
git status
git config --global user.email "laurent@geturl.net"
git config --global user.name "aliokan"
git commit -m "update downloads.yml"
git push
echo "is pushed."
