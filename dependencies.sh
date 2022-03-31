#!/bin/bash

curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
echo "14.18.1" > .node-version
fnm install
mkdir ~/npm-global
npm config set prefix '~/npm-global'
echo 'export PATH=~/npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
npm install -g @angular/cli
