#!/bin/bash
cd $HOME

#Generate documentation
haxe -cp ./hexcore/src -cp ./hexlog/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdsl/src --macro "include('hex')" -D doc-gen --no-output -xml xml/php.xml -php bin
haxe -cp ./hexcore/src -cp ./hexlog/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdsl/src --macro "include('hex')" -D doc-gen --no-output -xml xml/neko.xml -neko bin/docs.n
haxe -cp ./hexcore/src -cp ./hexlog/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdsl/src --macro "include('hex')" -D doc-gen --no-output -xml xml/js.xml -js bin/docs.js
haxe -cp ./hexcore/src -cp ./hexlog/src -cp ./hexreflection/src -cp ./hexinject/src -cp ./hexmvc/src -cp ./hexioc/src -cp ./hexservice/src -cp ./hexannotation/src -cp ./hexstate/src -cp ./hexunit/src -cp ./hexdsl/src --macro "include('hex')" -D doc-gen --no-output -xml xml/flash.xml -swf-version 11 -swf bin/docs.swf

haxelib run dox -i xml -o api --toplevel-package "hex" --title "HEXMACHINA - API" -theme ./hexdoctheme/theme/
