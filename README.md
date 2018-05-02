```bash

 █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝


```

Usefull scripts to automate a first time macOS setup.

Run *config-my-system.sh* to:
---
 - Install homebrew
 - Run brew doctor
 - Run brew update
 - Install coreutils
 - Install rbenv
 - Add load rbenv code to .bash_profile, .profile and .zshrc
 - Install ruby version set at RUBY_VERSION
 - Set new installed ruby version as global ruby version for rbenv
 - Verify that rbenv is properly set up
 - Install bundler
 - Run bundler install
    - Install cocoapods
    - Install slather
    - Install xcpretty

Run *install-gitlab-runned.sh if you need get gitlab-runner installed and registered in your machine.
---
