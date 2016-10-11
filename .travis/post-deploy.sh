#!/bin/bash
echo "checkout gh-pages branch"
git clone https://github.com/DoclerLabs/hexMachina.git ~/hexMachina
cd ~/hexMachina
git checkout gh-pages
echo "update downloads.yml content."
node $TRAVIS_BUILD_DIR/.travis/update-download-list.js ~/hexMachina
echo "delete old documentation."
git rm -rf ./docs/api
echo "add new documentation."
mv $HOME/api ./docs/api
git add ./docs/api
echo "commit change."
git status
git config credential.helper "store --file=.git/credentials"
echo "https://$GH_TOKEN:@github.com" > .git/credentials
git commit -a -m "update downloads.yml and api documentation"
git push
echo "is pushed."
