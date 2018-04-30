#!/bin/bash
cd $HOME

# Generate documentation
haxe -cp ./hexlog/src -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexannotation/src -cp ./hexinject/src -cp ./hexdsl/src -cp ./hexcommand/src -cp ./hexunit/src --macro "include('hex')" -D doc-gen --no-output -xml xml/php.xml -php bin
haxe -cp ./hexlog/src -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexannotation/src -cp ./hexinject/src -cp ./hexdsl/src -cp ./hexcommand/src -cp ./hexunit/src --macro "include('hex')" -D doc-gen --no-output -xml xml/neko.xml -neko bin/docs.n
haxe -cp ./hexlog/src -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexannotation/src -cp ./hexinject/src -cp ./hexdsl/src -cp ./hexcommand/src -cp ./hexunit/src --macro "include('hex')" -D doc-gen --no-output -xml xml/js.xml -js bin/docs.js
haxe -cp ./hexlog/src -cp ./hexcore/src -cp ./hexreflection/src -cp ./hexannotation/src -cp ./hexinject/src -cp ./hexdsl/src -cp ./hexcommand/src -cp ./hexunit/src --macro "include('hex')" -D doc-gen --no-output -xml xml/flash.xml -swf-version 11 -swf bin/docs.swf

haxelib install dox

haxelib run dox -i xml -o api --toplevel-package "hex" --title "HEXMACHINA - API" -theme ./hexdoctheme/theme/
