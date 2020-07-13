#!/bin/sh

if [ "$islinux" = 1 ]; then
    link_home emacs.el .emacs
else
    link_home emacs-win.el .emacs
fi
link_home module .emacs.d/module
link_home script .emacs.d/script
