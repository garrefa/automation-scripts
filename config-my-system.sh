#!/bin/sh

# This script will:
# - Install homebrew
# - Run brew doctor
# - Run brew update
# - Install coreutils
# - Install rbenv
# - Add load rbenv code to .bash_profile, .profile and .zshrc
# - Install ruby version set at RUBY_VERSION
# - Set new installed ruby version as global ruby version for rbenv
# - Verify that rbenv is properly set up
# - Install bundler
# - Run bundler install to install all dependencies in Gemfile

IFS=$'\n'
# set -x

LINE="=============================================================================="

cat << "EOF"



 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗     ███╗   ███╗██╗   ██╗    ███████╗██╗   ██╗███████╗
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝     ████╗ ████║╚██╗ ██╔╝    ██╔════╝╚██╗ ██╔╝██╔════╝
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗    ██╔████╔██║ ╚████╔╝     ███████╗ ╚████╔╝ ███████╗
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║    ██║╚██╔╝██║  ╚██╔╝      ╚════██║  ╚██╔╝  ╚════██║
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝    ██║ ╚═╝ ██║   ██║       ███████║   ██║   ███████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝     ╚═╝     ╚═╝   ╚═╝       ╚══════╝   ╚═╝   ╚══════╝




EOF

# Install homebrew
which brew >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing homebrew..."
    echo $LINE
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure brew is working ok
echo "Making sure you are ready to brew..."
echo $LINE
brew doctor
if [ $(echo $?) != 0 ]; then
    echo "Please fix the errors before continuing"
    return $?
fi

# Update brew
echo "\nUpdating brew..."
echo $LINE
brew update

# Install coreutils
brew list|grep coreutils >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing coreutils..."
    echo $LINE
    brew install coreutils
fi

brew list|grep swiftlint >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing swiftlint..."
    echo $LINE
    brew install swiftlint
fi

brew list|grep swiftgen >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing swiftgen..."
    echo $LINE
    brew install swiftgen
fi

# Install rbenv
brew list|grep rbenv >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing rbenv..."
    echo $LINE
    brew install rbenv
    # Add load rbenv to .bash_profile, .profile and .zshrc
    if [ -f ~/.bash_profile ]; then
        echo "# LOAD rbenv" >> ~/.bash_profile
        echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    fi
    if [ -f ~/.profile ]; then
        echo "# LOAD rbenv" >> ~/.profile
        echo 'eval "$(rbenv init -)"' >> ~/.profile
    fi
    if [ -f ~/.zshrc ]; then
        echo "# LOAD rbenv" >> ~/.zshrc
        echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    fi
    # LOAD rbenv
    eval "$(rbenv init -)"
fi

# Install ruby and make it the default (global) ruby version
RUBY_VERSION=2.5.1
rbenv versions|grep $RUBY_VERSION >> /dev/null
if [ $(echo $?) == 1 ]; then
    echo "Installing ruby $RUBY_VERSION"
    echo $LINE
    rbenv install $RUBY_VERSION
    rbenv global $RUBY_VERSION
fi

echo "\nVerifing that rbenv is properly set up"
echo $LINE
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo "\n"$LINE
echo "If you want to set a specific ruby version in some repository"
echo "run: rbenv local (VERSION), ex: rbenv local 2.5.1"
echo $LINE"\n"

echo "\nInstalling bundler (https://bundler.io/)"
echo $LINE
gem install bundler

echo "\nInstalling required dependencies"
echo $LINE
cat Gemfile | grep ^gem | cut -d \' -f 2
echo
bundle install

exit 0
