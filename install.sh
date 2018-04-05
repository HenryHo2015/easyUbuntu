#!/bin/bash

echo "安装将会话费一定时间，请您耐心等待完成=￣ω￣="

echo "正在配置各种源=￣ω￣="
mv ./.pip/ ~/
sudo mv -f /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv -f ./sources.list /etc/apt/
sudo apt-get update

echo "正在安装相应软件=￣ω￣="
sudo apt-get install -f python-dev python3-dev python-pip python3-pip shadowsocks git tmux zsh vim-nox-py2 ctags xclip astyle python-setuptools

echo "正在配置 shadowsocks"
sudo mv -f ./ss.json /etc/
sudo mv -f ./rc.local /etc

echo "正在配置 git 代理"
git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'

echo "正在配置 tmux"
mv ./.tmux.conf $HOME
tmux source-file .tmux.conf

echo "配置 zsh"
sudo sh ./zsh_install.sh
chsh -s /bin/zsh

echo "配置 VIM"
sudo easy_install -ZUi http://pypi.douban.com/simple/ autopep8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/realhaoyu/vim.git
mv -f ~/.vim ~/.vim_old
mv -f ~/vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "正在努力为女装dalao安装bundle程序" > realhaoyu
echo "安装完毕将自动退出" >> realhaoyu
echo "请耐心等待" >> realhaoyu
vim realhaoyu -c "BundleInstall" -c "q" -c "q"
rm realhaoyu
