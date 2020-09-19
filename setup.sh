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

# - Install Install Oh-My-Zsh
fancy_echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fancy_echo "Fixing post-install oh-my-zsh autocompletition issues..."
compaudit | xargs chmod g-w
source ~/.zshrc

# - If Homebrew is not installed
if ! which brew > /dev/null; then
    fancy_echo "Installing Homebrew..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi;

# - Update brew
fancy_echo "Updating brew..."
brew update

# - Install everything in Brewfile
# brew bundle Brewfile
fancy_echo "Installing dependencies from Brewfile..."
brew bundle install --verbose

# — Postinstall configuration for Postgres.app to use CLI Tools
fancy_echo "Setting up CLI Tools from 'Postgres.app'..."
sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
fancy_echo "Verifying 'Postgres.app' CLI config..."
which psql

# — Install RVM
fancy_echo "Configuring RVM as version manager for Ruby..."
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm | head -n 1

# — Install latest stable Ruby
fancy_echo "Installing latest stable Ruby..."
#rvm use ruby --install --default
rvm use ruby --install --latest
ruby -vs

# — Install and config Git
fancy_echo "Configuring git..."
git --version
git config --global user.name "Alejandro Ventura Contreras"
git config --global user.email "soyalexventura@gmail.com"
git config --global color.ui true
git config --global core.editor "vim"

# — Install Rails
fancy_echo "Installing Rails..."
gem install rails --no-document
rails --version

# - Manually install Node Version Manager `zsh-nvm` as Zsh plugin for installing, updating and loading NVM
fancy_echo "Installing ZSH-NVM plugin for oh-my-zsh..."
# Clone this repository somewhere (~/.zsh-nvm for example)
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
# Then source it in your .zshrc (or .bashrc)
fancy_echo "Adding NVM to .zshrc file..."
echo "source ~/.zsh-nvm/zsh-nvm.plugin.zsh" > ~/.zshrc
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
fancy_echo "Verifying NVM installation..."
command -v nvm
fancy_echo "Upgrading NVM installation..."
nvm upgrade

# - Install NodeJs
fancy_echo "Installing NodeJs LTS version..."
# https://github.com/nvm-sh/nvm#long-term-support
nvm install --lts

# - Install Yarn
fancy_echo "Installing Yarn..."
brew install yarn

# - Install Prettier global
fancy_echo "Installing Prettier for vim-prettier plugin..."
#npm install --global prettier
yarn global add prettier

# - Install fonts
fancy_echo "Installing fonts for iTerm..."
font_dir="$HOME/Library/Fonts"
cp "iTerm/fonts/InconsolataForPowerline.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMono-Book.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMono-BookItalic.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMono-Light.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMono-LightItalic.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMonoLig-Book.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMonoLig-BookItalic.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMonoLig-Light.otf" "$font_dir/"
cp "iTerm/fonts/OperatorMonoLig-LightItalic.otf" "$font_dir/"

# - Install Vim plugin manager
fancy_echo "Installing Vim-Plug for unix..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# - Generate SSH keys
fancy_echo "Generating a new SSH key..."
ssh-keygen -t rsa -b 4096 -C "soyalexventura@gmail.com"
fancy_echo "Start the ssh-agent in the background..."
eval "$(ssh-agent -s)"
fancy_echo "Add your SSH private key to the ssh-agent and store your passphrase in the keychain..."
ssh-add -K ~/.ssh/id_rsa
fancy_echo "Copying the SSH key to your clipboard...."
pbcopy < ~/.ssh/id_rsa.pub
fancy_echo "Opening Github.com user settings for SSH and GPG keys..."
open https://github.com/settings/keys
fancy_echo "Now you click `New SSH key`, set a tittle for the new key, finally paste your `id_rsa.pub`."

# - Configure custom config files for Vim
fancy_echo "Symlinking customization files for VIM..."
mkdir -p /.vim/_backup
mkdir -p /.vim/_temp
ln -sf ~/Dropbox/Code/dotfiles/vim/gvimrc ~/.gvimrc
ln -sf ~/Dropbox/Code/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/Dropbox/Code/dotfiles/ssh/config ~/.ssh/config

# - Applying customizations for oh-my-zsh
fancy_echo "Setting your personal theme for oh-my-zsh..."
# cp ~/Dropbox/Code/dotfiles/zsh/themes/alexventuraio.zsh-theme ~/.oh-my-zsh/themes/alexventuraio.zsh-theme
cp ~/Dropbox/Code/dotfiles/zsh/themes/alexventuraio.zsh-theme $ZSH_CUSTOM/themes/
fancy_echo "Changing the default theme for oh-my-zsh..."
sed -i "" "s|robbyrussell|alexventuraio|" ~/.zshrc
fancy_echo "Updating plugins section for oh-my-zsh..."
sed -i "" "s|(git.*)|(git osx ruby rails bundler brew rake capistrano)|" ~/.zshrc
fancy_echo "Appending personal customizations to .zshrc file..."
cp ~/Dropbox/Code/dotfiles/zsh/zshrc.local >> ~/.zshrc

fancy_echo "Setting up Mac OS X development, done!!!!"
