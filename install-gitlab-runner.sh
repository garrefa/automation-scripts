#!/bin/sh

IFS=$'\n'
# set -x

LINE="=============================================================================="
UPDATE=false

# Check if gitlab-runner is already installed and if it is ask the user if he wants to update
which gitlab-runner >> /dev/null
if [ $(echo $?) == 0 ]; then
    UPDATE=true
    read -p "Gitlab runner is already installed, do you want to update it? [y/N] " answer
    if [ $answer != "y" ]; then
        exit 0
    fi
    echo "\nStopping gitlab"
    echo $LINE"\n"
    gitlab-runner stop
fi

echo "\nDownloading the macOS binary"
echo $LINE"\n"
mkdir -p ~/tmp/bin/
curl --output ~/tmp/bin/gitlab-runner\
 https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64

echo "\nGiving it permissions to execute"
echo $LINE"\n"
# chmod +x /usr/local/bin/gitlab-runner
chmod +x ~/tmp/bin/gitlab-runner

echo "\nRegistering runner"
echo $LINE"\n"
gitlab-runner register

echo "\nInstall the runner as service"
echo $LINE"\n"
cd ~
gitlab-runner install

echo "\nStarting it"
echo $LINE"\n"
gitlab-runner start

exit 0
