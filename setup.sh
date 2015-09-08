#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y vim git ctags cscope python-dev cmake ack-grep silversearcher-ag
elif which yum >/dev/null; then
    sudo yum install -y vim git ctags cscope python-devel cmake
fi

rm ~/.vimrc &>/dev/null
ln -s ~/.vim/.vimrc ~/.vimrc

touch ~/.vim/.vimrc.local

mtype=`uname -m`
if [[ "$mtype" != "ppc64le" ]]; then
    echo "let g:support_ycm=true" >> ~/.vim/.vimrc.local
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -u ~/.vimrc +BundleInstall +BundleClean +qall

if [[ "$mtype" != "ppc64le" ]]; then
    cd ~/.vim/bundle/YouCompleteMe && (./install.py --clang-completer ; cd -) #not support ppc64, sorry
fi
#cd ~/.vim/bundle/fonts && (install.sh ; cd -)
echo "安装完成"
