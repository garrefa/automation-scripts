#!/usr/bin/env bash

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

brew list wget >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing wget..."
    echo $LINE
    brew install wget
fi

brew tap homebrew/cask
brew tap caskroom/fonts

brew cask list gpg-suite >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing gpg-suite..."
    echo $LINE
    brew cask install gpg-suite
fi

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

echo "Downloading Darcula theme files to ${HOME}/darcula"

wget https://github.com/bulenkov/Darcula/archive/master.zip \
    -P "${HOME}/darcula-tmp"

unzip "${HOME}/darcula-tmp/master.zip" \
    -d "${HOME}/darcula-tmp" >> /dev/null

mv "${HOME}/darcula-tmp/Darcula-master" "${HOME}/darcula" >> /dev/null

rm -rf "${HOME}/darcula-tmp" >> /dev/null

git clone git@github.com:garrefa/git-aliases.git "${HOME}/git-aliases"
