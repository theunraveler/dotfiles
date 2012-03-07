#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$( dirname "$0" )" && pwd )"

cd ~;
ln -s $DIR/cap/caprc .caprc;
ln -s $DIR/drush/drush .drush;
ln -s $DIR/git/gitignore .gitignore;
ln -s $DIR/git/template .gittemplate;
ln -s $DIR/htop/htoprc .htoprc;
ln -s $DIR/general/hushlogin .hushlogin;
ln -s $DIR/mysql/my.cnf .my.cnf;
ln -s $DIR/node/npmrc .npmrc;
ln -s $DIR/rsync .rsync;
ln -s $DIR/rvm/rvmrc .rvmrc;
ln -s $DIR/task/taskrc .taskrc;
ln -s $DIR/vim/vim .vim;
ln -s $DIR/vim/vimrc .vimrc;
ln -s $DIR/zsh/zsh .zsh;
ln -s $DIR/zsh/zshrc .zshrc;
cd $WD;
