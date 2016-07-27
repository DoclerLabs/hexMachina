#!/bin/bash
cd $HOME
zip -r ./hexMachina-bundle-${TRAVIS_TAG}.zip ./hexcore/src ./hexcore/test ./hexcore/README.md ./hexinject/src ./hexinject/test ./hexinject/README.md ./hexmvc/src ./hexmvc/test ./hexmvc/README.md ./hexioc/src ./hexioc/test ./hexioc/README.md ./hexservice/src ./hexservice/test ./hexservice/README.md ./hexannotation/src ./hexannotation/test ./hexannotation/README.md ./hexstate/src ./hexstate/test ./hexstate/README.md ./hexunit/src ./hexunit/test ./hexunit/README.md 
mv ./hexMachina-bundle-${TRAVIS_TAG}.zip $TRAVIS_BUILD_DIR