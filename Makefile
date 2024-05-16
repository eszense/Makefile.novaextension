#!/usr/bin/make -f

.PHONY: build
build: Syntaxes/libtree-sitter-makefile.dylib

.PHONY: clean
clean:
	rm -rf build
	rm -f Syntaxes/libtree-sitter-makefile.dylib
	rm -rf tree-sitter-makefile

.PHONY: bump-version
bump-version:
	python3 scripts/bump-version.py

.PHONY: publish
publish: bump-version
	nova extension publish .

###################################################################################################################

Syntaxes/libtree-sitter-makefile.dylib: build/TreeSitterParserBuild/Makefile tree-sitter-makefile/src/parser.c
	rm -f build/TreeSitterParserBuild/libtree-sitter-makefile.dylib
	CC="cc -arch arm64 -arch x86_64" make -C build/TreeSitterParserBuild SRC_DIR=`realpath tree-sitter-makefile/src`
	codesign -s - build/TreeSitterParserBuild/libtree-sitter-makefile.dylib
	mv -f build/TreeSitterParserBuild/libtree-sitter-makefile.dylib Syntaxes

build/TreeSitterParserBuild/Makefile: build/panic_script.zip
	unzip -o -d build build/panic_script.zip TreeSitterParserBuild/compile_parser.sh TreeSitterParserBuild/Makefile
	touch build/TreeSitterParserBuild/Makefile

build/panic_script.zip:
	mkdir -p build
	curl -fsSL https://docs.nova.app/syntax-reference/build_script.zip > build/_panic_script.zip
	mv build/_panic_script.zip build/panic_script.zip

tree-sitter-makefile/src/parser.c: tree-sitter-makefile/node_modules/.bin/tree-sitter tree-sitter-makefile/src/grammar.json
	cd tree-sitter-makefile && node_modules/.bin/tree-sitter generate --no-bindings

tree-sitter-makefile/node_modules/.bin/tree-sitter: tree-sitter-makefile/package.json
	cd tree-sitter-makefile && npm install

tree-sitter-makefile/src/grammar.json tree-sitter-makefile/package.json:
	git submodule update --init --recursive



