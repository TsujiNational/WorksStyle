#!/bin/bash

sudo cp ~/dev/boost_1_57_0.tar.gz ./src/opt_src/boost
cd src/opt_src/boost
tar -zxvf boost_1_57_0.tar.gz
cd boost_1_57_0
./bootstrap.sh
./b2 --with-regex
cd ../../../..
echo /src/opt_src/boost/ >> .gitignore
