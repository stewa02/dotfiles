#!/bin/bash

# Install all needed packages
# * editors: vim, emacs
# * browsers: w3m, links, elinks
# * encryption: gpg
# * mail: mutt
# * interpreters: perl, perl6, latex
# * PDF readers: zathura
# * git

apt-get update
apt-get upgrade
apt-get install vim emacs w3m links elinks gpg mutt perl perl6 latex zathura git

