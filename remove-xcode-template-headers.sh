#!/bin/sh

# This script will remove all the useless headers from Xcode .c, .h, .m and .swift files.
#
# Example of a typical header:
#
# //
# //  <file name>
# //  <Name of project>
# //
# //  Created by <My name> on <Date>.
# //  Copyright <Year and company>. All rights reserved.
# //
#
# It has little useful information, and often incorrect. As file name, project and company changes
# how can we keep in sync file comments? In Agile environment when we pair on shared computers the
# author name often set to generic ‘Developer’. We also use version control system that can tell us
# the date when file was created along with all history of modifications. Let’s just get rid of those
# boiler plate comments and have extra 7 lines on screen to see source code.
#
# Ref: https://paulz.github.io/xcode/source/code/2015/12/12/remove-default-header-comment-in-xcode.html

IFS=$'\n'
#set -x

LINE="=============================================================================="

removeHeaders() {
    sudo find -E $1 -type f \
        \( -regex '.*\.[chm]' -or -regex '.*\.swift' \) \
        -exec /usr/bin/sed -i '' '1,/^$/d' '{}' ';'
}

removeHeaders "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates"
removeHeaders "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"

echo "\nHeaders removed, restart Xcode"
echo $LINE
