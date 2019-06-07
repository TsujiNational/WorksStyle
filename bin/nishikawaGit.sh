#!/bin/bash

cd

cp ~/nishikawa/.ssh/config ~/.ssh/

git config --global user.name 'Jun Nishikawa'
git config --global user.email nishikawa.01.11040707@nationalsoftware.co.jp

eval `ssh-agent`
ssh-add ~/.ssh/nishi_rsa

ssh-add -l
ssh 210.134.145.112
