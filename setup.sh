#!/bin/bash

# *** Just a simple fancy console output ***
fancy_echo() {
    local fmt="$1"; shift

    # shellcheck disable=SC2059
    printf "\\n$fmt\\n" "$@"
}
# *** Append settings to my .zshrc profile file ***
append_to_zshrc() {
    local text="$1" zshrc
    local skip_new_line="${2:-0}"

    if [ -w "$HOME/.zshrc.local" ]; then
        zshrc="$HOME/.zshrc.local"
    else
        zshrc="$HOME/.zshrc"
    fi

    if ! grep -Fqs "$text" "$zshrc"; then
        if [ "$skip_new_line" -eq 1 ]; then
            printf "%s\\n" "$text" >> "$zshrc"
        else
            printf "\\n%s\\n" "$text" >> "$zshrc"
        fi
    fi
}

#
# - Install all the things with Homebrew, Casks and a Brewfile
#

# - If Homebrew is not installed
if ! which brew > /dev/null; then
    fancy_echo "Installing Homebrew..."
    # Install Homebrew 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# - Update brew
brew update

# - Install everything in Brewfile
# brew bundle Brewfile
brew bundle

# — Install RVM and Ruby
fancy_echo "Configuring RVM as version manager for Ruby..."
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm | head -n 1
rvm use ruby --install --default
ruby -vs

# — Install and config Git
fancy_echo "Configuring git..."
git --version
git config --global user.name "Alejandro Ventura Contreras"
git config --global user.email "venturacontreras@icloud.com"
git config --global color.ui true
git config --global core.editor "vim"

# — Install Rails
fancy_echo "Installing Rails..."
gem install rails --no-document
rails --version

# - Install NodeJs
fancy_echo "Installing NVM for node..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
fancy_echo "Verifying installation..."
command -v nvm
fancy_echo "Installing NodeJs LTS version..."
# https://github.com/nvm-sh/nvm#long-term-support
nvm install --lts
fancy_echo "Installing Prettier for vim-prettier plugin..."
npm install --global prettier

# - Setup custom Cobalt2 theme for oh-my-zsh
fancy_echo "Setting up theme for oh-my-zsh..."
cp zsh/themes/alexventuraio.zsh-theme ~/.oh-my-zsh/themes/alexventuraio.zsh-theme

# - Install fonts
fancy_echo "Installing fonts for iTerm..."
font_dir="$HOME/Library/Fonts"
cp "iTerm/Inconsolata\ for\ Powerline.otf" "$font_dir/"
cp "iTerm/OperatorMono-Light.otf" "$font_dir/"
cp "iTerm/OperatorMono-Book.otf" "$font_dir/"
cp "iTerm/OperatorMono-BookItalic.otf" "$font_dir/"

# - Install Janus vim
fancy_echo "Installing Janus for vim..."
curl -L https://bit.ly/janus-bootstrap | bash
mkdir ~/.janus
cd ~/.janus
fancy_echo "Installing plugings for Janus for vim..."
git clone https://github.com/wakatime/vim-wakatime
git clone https://github.com/vim-scripts/UltiSnips
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/prettier/vim-prettier
git clone https://github.com/jlanzarotta/bufexplorer
git clone https://github.com/tpope/vim-bundler
git clone https://github.com/tpope/vim-rails
vim -u NONE -c "helptags vim-rails/doc" -c q

# - Configure custom files for Janus vim
fancy_echo "Symlinking customization files for Janus vim..."
ln -sf ~/Dropbox/Code/dotfiles/vim/gvimrc.after ~/.gvimrc.after
ln -sf ~/Dropbox/Code/dotfiles/vim/vimrc.before ~/.vimrc.before
ln -sf ~/Dropbox/Code/dotfiles/vim/vimrc.after ~/.vimrc.after
ln -sf ~/Dropbox/Code/dotfiles/vim/UltiSnips/ ~/.vim/

fancy_echo "Setting up Mac OS X development, done!!!!"
