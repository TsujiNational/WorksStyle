#!/bin/bash

cd

cp ~/akeyama/.ssh/config ~/.ssh/

git config --global user.name 'Ryota Akeyama'
git config --global user.email akeyama.01.08096456@nationalsoftware.co.jp

eval `ssh-agent`
ssh-add ~/.ssh/ake_rsa

ssh-add -l
ssh 210.134.145.112
