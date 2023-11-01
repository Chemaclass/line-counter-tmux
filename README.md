# line-counter-tmux

## Features

* Count the total amount of code lines within a project
* Specify language to look for
* Specify a directory to ignore

## Installation with Tmux Plugin Manager (TPM)

1. Add the plugin to your tmux.conf:
```bash
set -g @plugin 'Nelliguns/line-counter-tmux'
```
2. Press prefix + <kbd>I</kbd> to install the plugin.

## Usage

Once installed, you can use the key binding \<prefix>C to retrieve the amounted lines of code for the current working directory.

## Configuration

By adding the following lines to your tmux.conf file you can customize the name of the directory to ignore and the file endings of the languages you want to look for as well as the command to run the plugin. 

```bash
set -g @env "venv"
set -g @file_endings "py"
```
