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

IFS=$'\n'
# set -x

LINE="=============================================================================="

cat << "EOF"



 _____              __ _        ___  ___        _____           _
/  __ \            / _(_)       |  \/  |       /  ___|         | |
| /  \/ ___  _ __ | |_ _  __ _  | .  . |_   _  \ `--. _   _ ___| |_ ___ _ __ ___
| |    / _ \| '_ \|  _| |/ _` | | |\/| | | | |  `--. \ | | / __| __/ _ \ '_ ` _ \
| \__/\ (_) | | | | | | | (_| | | |  | | |_| | /\__/ / |_| \__ \ ||  __/ | | | | |
 \____/\___/|_| |_|_| |_|\__, | \_|  |_/\__, | \____/ \__, |___/\__\___|_| |_| |_|
                          __/ |          __/ |         __/ |
                         |___/          |___/         |___/



EOF

# Helper function to check whether a command is present
function isInstalled() {
    LOCATION=$(which $1)
    # -z: returns True of the length if "STRING" is zero.
    if [ -z $LOCATION ]; then
        return 0
    fi
    return 1
}

# Install homebrew
isInstalled brew
if [ $(echo $?) == 0 ]; then
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

exit 0
