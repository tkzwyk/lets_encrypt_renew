#!/bin/bash

set -ex

cd $HOME/letsencrypt

git pull

# Necessary to successfully execute './letsencrypt-auto renew'
# Refer to : http://blog.fspm.jp/2016/06/letsencrypterror-importerror-no-module.html
unset PYTHON_INSTALL_LAYOUT

# Stop temporarily apache to use https port by 'Let's encrypt'
sudo apachectl -k stop

./letsencrypt-auto renew

sudo apachectl -k start

