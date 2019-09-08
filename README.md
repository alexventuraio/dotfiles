# My Dotfiles

This is [Alex Ventura's](https://twitter.com/soyalexventura) dotfiles. Feel free to use, modify, share and enhance any config file. This is the config I use to set up on any new computer.

## How to install

1. Clone this repo

    ```
    mkdir -p ~/dotfiles && cd ~/dotfiles && git clone https://github.com/AlexVentura/dotfiles.git
    ```

2. Install Oh-My-ZSH

    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

5. Install Janus for Vim

    ```
    curl -L https://bit.ly/janus-bootstrap | bash
    ```
    ```
    git clone https://github.com/mattn/emmet-vim.git ~/.janus/emmet-vim
    ```
    ```
    git clone git://github.com/wakatime/vim-wakatime.git ~/.janus/vim-wakatime
    ```
    ```
    git clone https://github.com/vim-airline/vim-airline ~/.janus/vim-airline
    ```
    ```
    git clone https://github.com/vim-airline/vim-airline-themes ~/.janus/vim-airline-themes
    ```
    ```
    git clone https://github.com/itchyny/lightline.vim ~/.janus/lightline-vim
    ```

6. Symlink configs

    ```
    ln -s ~/code/dotfiles/zsh/themes/excid3.zsh-theme ~/.oh-my-zsh/themes/excid3.zsh-theme
    ln -s ~/code/dotfiles/zsh/zshrc ~/.zshrc
    ln -s ~/code/dotfiles/vim/gvimrc.after ~/.gvimrc.after
    ```

7. Open iTerm and import color scheme from iterm folder

# Other tips

Here are some other useful commands I like to use:

#### Pretty ```git lg```

	git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
