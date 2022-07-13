#!/bin/bash

set -xe

# minimal install packages
sudo dnf install git clang lld

# replace gcc with clang and ld with lld
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 50

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 50

# Select default compiler
sudo update-alternatives --config cc
sudo update-alternatives --config c++

sudo rm -rf /usr/bin/ld
sudo ln -sf /usr/bin/ld.lld /usr/bin/ld
