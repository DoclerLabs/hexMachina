#!/bin/bash
echo "make zip bundle file."
sh $TRAVIS_BUILD_DIR/.travis/make-hexMachina-bundle.sh

echo "make documentation"
sh $TRAVIS_BUILD_DIR/.travis/make-documentation.sh