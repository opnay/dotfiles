echo "📕 Install .gitconfig"
cat .gitconfig.ext >> ~/.gitconfig

echo "📕 Install powerline fonts"
echo "- Clone git"
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts
echo "- Run install script"
/bin/sh ./install.sh


echo "📕 Install oh-my-zsh/theme/agnoster.custiom"
echo "- Copy Theme"
cp theme/agnoster.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster.zsh-theme
echo "- Change .zshrc config"
sed -i 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/gi' ~/.zshrc
