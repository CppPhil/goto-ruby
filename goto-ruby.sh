#!/bin/bash

display_help () {
    echo "Usage: $0 [options] script.rb [arguments]..."
    echo "goto-ruby launches a ruby script."
    echo ""
    echo "Example:"
    echo "  $0 build.rb Debug"
    echo ""
    echo "Options:"
    echo "  -?, -h, --help    give this help list"
}

ruby_not_installed () {
    readonly error_msg="Ruby is not installed on this system.\nTo install ruby install the appropriate package using your package manager.\nThe package is typically called ruby-full.\nIf you are using apt-get the command would be\nsudo apt-get install ruby-full -y"
    echo -e $error_msg
    exit 1
}

if [ "$#" -eq 0 ]; then
    display_help
    exit 1
fi

case "$1" in
    --help|-h|-?)
        display_help
        exit 1
        ;;
esac

readonly whichResult=$(which ruby)

if [ "$whichResult" == "" ]; then
    ruby_not_installed
fi

ruby "$@"
exit 0
