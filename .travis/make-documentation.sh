#!/bin/bash
cd $HOME

#Generate documentation
haxe -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdoctheme/src -cp ./hexdsl/src --macro "ImportAll.run()" --no-output -xml xml/js.xml -js bin/docs.js
haxe -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdoctheme/src -cp ./hexdsl/src --macro "ImportAll.run()" --no-output -xml xml/flash.xml -swf-version 11 -swf bin/docs.swf
haxe -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdoctheme/src -cp ./hexdsl/src --macro "ImportAll.run()" --no-output -xml xml/neko.xml -neko bin/docs.n

haxelib run dox -i xml -o api --toplevel-package "hex" --title "HEXMACHINA - API" -theme ./hexdoctheme/theme/