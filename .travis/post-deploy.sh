#!/bin/bash
echo "checkout gh-pages branch"
git clone https://github.com/aliokan/hexMachina.git ~/hexMachina
cd ~/hexMachina
git checkout gh-pages
echo "update downloads.yml content."
node $TRAVIS_BUILD_DIR/.travis/update-download-list.js ~/hexMachina
echo "commit change."
git status
git config credential.helper "store --file=.git/credentials"
echo "https://$GH_TOKEN:@github.com" > .git/credentials
git commit -m "update downloads.yml"
git push
echo "is pushed."
