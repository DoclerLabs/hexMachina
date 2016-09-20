#!/bin/bash
cd $HOME
mkdir hexmachina-bundle hexmachina-bundle/src hexmachina-bundle/test
rsync -a ./hexcore/src ./hexmachina-bundle/src 
rsync -a ./hexcore/test ./hexmachina-bundle/test 
rsync -a ./hexinject/src ./hexmachina-bundle/src 
rsync -a ./hexinject/test ./hexmachina-bundle/test 
rsync -a ./hexmvc/src ./hexmachina-bundle/src 
rsync -a ./hexmvc/test ./hexmachina-bundle/test 
rsync -a ./hexioc/src ./hexmachina-bundle/src 
rsync -a ./hexioc/test ./hexmachina-bundle/test 
rsync -a ./hexservice/src ./hexmachina-bundle/src 
rsync -a ./hexservice/test ./hexmachina-bundle/test 
rsync -a ./hexannotation/src ./hexmachina-bundle/src 
rsync -a ./hexannotation/test ./hexmachina-bundle/test 
rsync -a ./hexstate/src ./hexmachina-bundle/src 
rsync -a ./hexstate/test ./hexmachina-bundle/test 
rsync -a ./hexunit/src ./hexmachina-bundle/src 
rsync -a ./hexunit/test ./hexmachina-bundle/test 
zip -r ./hexMachina-bundle-${TRAVIS_TAG}.zip  ./hexmachina-bundle
mv ./hexMachina-bundle-${TRAVIS_TAG}.zip $TRAVIS_BUILD_DIR
