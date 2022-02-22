echo "Figuring out which OS we are on... (this script might not work, I haven't tested it)"

os="$(uname -s)"

echo "...it is ${os}"

echo "Installing packages..."

if [ "$os" = "Linux" ] ; then

    sudo apt-add-repository universe
    sudo apt-get update
    sudo apt-get install fonts-firacode vim zsh
    chsh -s $(which zsh)

elif [ "$os" = "Darwin" ] ; then

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install wget zsh
    chsh -s $(which zsh)
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code

else
    echo "I'm not supported on $os yet!"
    return 0
fi

wget -O ~/.gitignore https://raw.githubusercontent.com/tobiaswadseth/dotfiles/main/.gitignore
wget -O ~/.vimrc https://raw.githubusercontent.com/tobiaswadseth/dotfiles/main/.vimrc
mkdir -P ~/.vim/autoload/lightline/colorscheme
wget -O ~/.vim/autoload/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim
wget -O ~/.vim/autoload/lightline/colorscheme https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
wget -O ~/.zshrc https://raw.githubusercontent.com/tobiaswadseth/dotfiles/main/.zshrc
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting