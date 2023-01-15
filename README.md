
# Makefile.novaextension

**Makefile** Syntax highlighting extension for [Panic Inc.](https://panic.com/) macOS IDE [Nova](https://nova.app/).

![image](https://github.com/eszense/Makefile.novaextension/raw/main/extension.png)

## Features

 - Natively compiled light-weight [Tree-Sitter](https://tree-sitter.github.io/) parser library for faster and more accurate highlighting than legacy regex-based algorithm
 - Rich highlighting of variables, targets, prerequisite, recipe etc
 - Based on [GNU make syntax](https://www.gnu.org/software/make/manual/make.html) 
 - Open source (GPL-3.0 license)

## Installation
Download [here](nova://extension?id=es.Makefile) or goto to menu `Extensions` > `Extension Library...` and search for `es.Makefile`.

Makefile syntax will be added under menu `Editor` > `Syntax` > `Makefile` and will be automatically enabled based on filename and shebang heuristics upon opening of Makefile.

## Contributing

Issue reporting and Pull requests are welcomed.
To compile the binary, clone this repository and execute the included `Build` task in Nova.
