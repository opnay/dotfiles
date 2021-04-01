echo "📕 Install .gitconfig"
git config --global alias.c "commit"
git config --global alias.cp "cherry-pick"
git config --global alias.ca "commit --amend"
git config --global alias.one "log --graph --all --pretty=format:'%h -%C(yellow)%d%C(reset) %s%C(reset)'"
git config --global alias.f "fetch"

echo "📕 Install powerline fonts"
echo "- Clone git"
git clone https://github.com/powerline/fonts.git --depth=1
echo "- Run install script"
(cd fonts && /bin/sh install.sh)

# echo "📕 Install oh-my-zsh/theme/agnoster.custiom"
# echo "- Copy Theme"
# cp theme/oh-my-zsh/agnoster.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster.zsh-theme
# echo "- Change .zshrc config"
# sed -i 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/gi' ~/.zshrc

echo "📕 Install oh-my-zsh/plugin/autojump"
echo "- Clone git"
git clone git://github.com/wting/autojump.git
echo "- Run install script"
(cd autojump && python install.py)
echo "- Add .zshrc"
sed -i 's/plugins=(\(.*\))/plugins=(\1 autojump)/gi' ~/.zshrc

echo "📕 Install oh-my-zsh/plugin/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/gi' ~/.zshrc
