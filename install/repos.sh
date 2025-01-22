#!/bin/bash

echo "Setting up GitHub repositories..."

mkdir -p ~/github/autobrr
mkdir -p ~/github/s0up4200

cd ~/github/autobrr

echo "Cloning autobrr repositories..."
git clone https://github.com/autobrr/autobrr.git
git clone https://github.com/autobrr/autobrr.com.git
git clone https://github.com/autobrr/tqm.git
git clone https://github.com/autobrr/mkbrr.git
git clone https://github.com/autobrr/netronome.git
git clone https://github.com/autobrr/netrono.me.git
git clone https://github.com/autobrr/dasbrr.git

echo "Cloning s0up4200 repositories..."
cd ~/github/s0up4200
git clone https://github.com/s0up4200/ptparchiver-go.git

echo "GitHub repositories setup complete!" 