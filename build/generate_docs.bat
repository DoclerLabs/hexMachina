haxelib newrepo
haxelib install hexmachina
haxelib git dox https://github.com/HaxeFoundation/dox.git

haxe doc_build.hxml
haxelib run dox -i ./bin/docs/ -o ../docs --title "hexMachina API" --toplevel-package hex -in hex