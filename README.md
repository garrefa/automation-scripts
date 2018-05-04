```bash

 █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝


```

Usefull scripts to automate a first time macOS setup.

## config-my-system.sh

 - Install homebrew
 - Run brew doctor
 - Run brew update
 - Install coreutils
 - Install bash updated version
 - Install git updated version
 - Install swiftlint
 - Install swiftgen
 - Install rbenv
 - Add load rbenv code to .bash_profile, .profile and .zshrc
 - Install ruby version set at RUBY_VERSION
 - Set new installed ruby version as global ruby version for rbenv
 - Verify that rbenv is properly set up
 - Install bundler
 - Run bundler install
    - Install cocoapods
    - Install fastlane
    - Install slather
    - Install xcpretty

## install-gitlab-runned.sh

If you need get gitlab-runner installed and registered in your machine.

## remove-xcode-template-headers.sh

This script will remove all the useless headers from Xcode .c, .h, .m and .swift files.

Example of a typical header:

```
//
//  <file name>
//  <Name of project>
//
//  Created by <My name> on <Date>.
//  Copyright <Year and company>. All rights reserved.
//
```

It has little useful information, and often incorrect. As file name, project and company changes
how can we keep in sync file comments? In Agile environment when we pair on shared computers the
author name often set to generic ‘Developer’. We also use version control system that can tell us
the date when file was created along with all history of modifications. Let’s just get rid of those
boiler plate comments and have extra 7 lines on screen to see source code.

Ref: [https://paulz.github.io/xcode/source/code/2015/12/12/remove-default-header-comment-in-xcode.html](https://paulz.github.io/xcode/source/code/2015/12/12/remove-default-header-comment-in-xcode.html)
