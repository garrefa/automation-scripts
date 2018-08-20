#!/bin/sh

# This script will:
# - Install bash-completion
# - Install bash-git-prompt
# - Install FiraCode
# - Install iterm2
# - Install Visual Studio Code
# - Download Darcula theme files to ~/darcula

IFS=$'\n'
# set -x

LINE="=============================================================================="

brew list bash-completion@2 >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing bash-completion..."
    echo $LINE
    brew install bash-completion@2
fi

brew list bash-git-prompt >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing bash-git-prompt..."
    echo $LINE
    brew install bash-git-prompt
fi

brew tap homebrew/cask
brew tap caskroom/fonts

brew cask list font-fira-code >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing FiraCode..."
    echo $LINE
    brew cask install font-fira-code
fi

brew cask list iterm2 >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing iterm2..."
    echo $LINE
    brew cask install iterm2
fi

brew cask list visual-studio-code >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing Visual Studio Code..."
    echo $LINE
    brew cask install visual-studio-code
fi

echo "Downloading Darcula theme files to ~/darcula"
wget https://github.com/bulenkov/Darcula/archive/master.zip -P ~/darcula-tmp
unzip ~/darcula-tmp/master.zip -p ~/darcula-tmp >> /dev/null
mv ~/darcula-tmp/Darcula-master ~/darcula >> /dev/null
rm -rf ~/darcula-tmp >> /dev/null

git clone git@github.com:garrefa/git-aliases.git ~/git-aliases
