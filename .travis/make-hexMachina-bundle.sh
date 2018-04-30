#!/bin/bash
cd $HOME
mkdir hexmachina-bundle hexmachina-bundle/src hexmachina-bundle/test
# hexLog
rsync -a ./hexlog/src ./hexmachina-bundle
rsync -a ./hexlog/test ./hexmachina-bundle
cp ./hexlog/README.md ./hexmachina-bundle/README-hexlog.md
# hexCore
rsync -a ./hexcore/src ./hexmachina-bundle 
rsync -a ./hexcore/test ./hexmachina-bundle 
cp ./hexcore/README.md ./hexmachina-bundle/README-hexcore.md
# hexReflection
rsync -a ./hexreflection/src ./hexmachina-bundle 
rsync -a ./hexreflection/test ./hexmachina-bundle 
cp ./hexreflection/README.md ./hexmachina-bundle/README-hexreflection.md
# hexAnnotation
rsync -a ./hexannotation/src ./hexmachina-bundle
rsync -a ./hexannotation/test ./hexmachina-bundle
cp ./hexannotation/README.md ./hexmachina-bundle/README-hexannotation.md
# hexInject
rsync -a ./hexinject/src ./hexmachina-bundle
rsync -a ./hexinject/test ./hexmachina-bundle
cp ./hexinject/README.md ./hexmachina-bundle/README-hexinject.md
# hexDsl
rsync -a ./hexdsl/src ./hexmachina-bundle 
rsync -a ./hexdsl/test ./hexmachina-bundle 
cp ./hexdsl/README.md ./hexmachina-bundle/README-hexdsl.md
# hexCommand
rsync -a ./hexcommand/src ./hexmachina-bundle
rsync -a ./hexcommand/test ./hexmachina-bundle
cp ./hexcommand/README.md ./hexmachina-bundle/README-hexcommand.md
# hexUnit
rsync -a ./hexunit/src ./hexmachina-bundle 
rsync -a ./hexunit/test ./hexmachina-bundle 
cp ./hexunit/README.md ./hexmachina-bundle/README-hexunit.md
# zip and move to $TRAVIS_BUILD_DIR
zip -r ./hexMachina-bundle-${TRAVIS_TAG}.zip  ./hexmachina-bundle
mv ./hexMachina-bundle-${TRAVIS_TAG}.zip $TRAVIS_BUILD_DIR
