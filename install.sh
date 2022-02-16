#!/usr/bin/zsh

function wait_clone() {
  git clone $1 $2
  PID=$!
  wait $PID
}

echo "🎯 Install .gitconfig"
git config --global alias.c "commit"
git config --global alias.cp "cherry-pick"
git config --global alias.ca "commit --amend"
git config --global alias.one "log --graph --all --pretty=format:'%h -%C(yellow)%d%C(reset) %s%C(reset)'"
git config --global alias.f "fetch"

# echo "🎯 Install powerline fonts"
# echo "📕 Clone git"
# git clone https://github.com/powerline/fonts.git --depth=1
# echo "📕 Run install script"
# (cd fonts && /bin/sh install.sh)

# echo "🎯 Install oh-my-zsh/theme/agnoster.custiom"
# echo "📕 Copy Theme"
# cp theme/oh-my-zsh/agnoster.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster.zsh-theme
# echo "📕 Change .zshrc config"
# sed -i 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/gi' ~/.zshrc
echo "🎯 Install homebrew"
CI=true /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

echo "🎯 Install oh-my-zsh/plugin/autojump"
echo "📕 Clone git"
wait_clone git://github.com/wting/autojump.git
echo "📕 Run install script"
(cd autojump && ./install.py)
echo "📕 Add .zshrc"
sed -i 's/plugins=(\(.*\))/plugins=(\1 autojump)/gi' ~/.zshrc

echo "🎯 Install oh-my-zsh/plugin/zsh-syntax-highlighting"
wait_clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/gi' ~/.zshrc

echo "🎯 Install oh-my-zsh/plugin/zsh-autosuggestions"
wait_clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/gi' ~/.zshrc

echo "🎯 Setup node_modules/.bin"
echo "PATH=./node_modules/.bin:\$PATH" >> ~/.zshrc

echo "🎯 Cleanup"
brew cleanup

echo "✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅"
