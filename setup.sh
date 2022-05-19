# Install required packages
sudo pacman -S cmake python mono go wget zsh
chsh -s $(which zsh)

# Configure zsh
cp .zshrc ~/.zshrc
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
zsh

# Install node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.zshrc
nvm install --lts
# Install java
curl -s "https://get.sdkman.io" | bash
source $HOME/.sdkman/bin/sdkman-init.sh
sdk install java 11.0.14.10.1-amzn

# Configure bspwm polybar and sxhkd
cp bspwmrc ~/.config/bspwm/bspwmrc
cp polybar.config ~/.config/bspwm/polybar/config
cp sxhkdrc ~/.config/sxhkd/sxhkdrc

# Configure vim
cp .gitignore ~/.gitignore
cp .vimrc ~/.vimrc
mkdir -P ~/.vim/autoload/lightline/colorscheme
wget -O ~/.vim/autoload/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim
wget -O ~/.vim/autoload/lightline/colorscheme https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim
zsh