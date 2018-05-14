#!/bin/bash
cd $HOME

# Generate documentation
haxe -lib hexunit  -lib hexdsl -lib hexcommand --macro "include('hex')" -D doc-gen --no-output -xml xml/php.xml -php bin
haxe -lib hexunit  -lib hexdsl -lib hexcommand --macro "include('hex')" -D doc-gen --no-output -xml xml/neko.xml -neko bin/docs.n
haxe -lib hexunit  -lib hexdsl -lib hexcommand --macro "include('hex')" -D doc-gen --no-output -xml xml/js.xml -js bin/docs.js
haxe -lib hexunit  -lib hexdsl -lib hexcommand --macro "include('hex')" -D doc-gen --no-output -xml xml/flash.xml -swf-version 11 -swf bin/docs.swf

haxelib install dox

haxelib run dox -i xml -o api --toplevel-package "hex" --title "HEXMACHINA - API" -theme ./hexdoctheme/theme/
