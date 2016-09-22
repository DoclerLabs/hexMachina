#!/bin/bash
echo "change branch master to gh-pages."
cd $TRAVIS_BUILD_DIR
git checkout gh-pages
echo "updpate downloads.yml content."
cd $HOME
node .travis/update-download-list.js $TRAVIS_BUILD_DIR
echo "commit change."
cd $TRAVIS_BUILD_DIR
git status
git commit -m "update downloads.yml"
git push
echo "is pushed."
