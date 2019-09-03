#!/bin/bash

# Directory containing this bash script
readonly DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

$DIR/../goto-ruby.sh $DIR/scripts/build.rb $1

exit 0
