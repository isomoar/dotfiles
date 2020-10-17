# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# zsh
brew install zsh

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh my zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# fish
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# fisher plugins
fisher add jethrokuan/z rafaelrinaldi/pure jethrokuan/fzf jorgebucaran/bax.fish jorgebucaran/nvm.fish 
set pure_color_git_branch "#808080"

# neovim
brew install neovim
brew install ripgrep
brew install fzf
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install python3
pip3 install --user pynvim
python3 -m pip install --user --upgrade pynvim

#:UpdateRemotePlugins

# tmux
brew install tmux

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
