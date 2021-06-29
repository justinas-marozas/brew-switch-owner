#!/bin/zsh
set -eo pipefail

if [[ -z $1 ]]
then
    echo "Must pass a username as an argument."
    echo "Example: $0 \`whoami\`"
    exit 1
fi

NEW_OWNER=$1

if [[ $EUID -ne 0 ]]
then
    echo "This script must be run as root."
    exit 1
fi

# brew update
chown -R $NEW_OWNER /usr/local/var/homebrew
chown -R $NEW_OWNER /usr/local/Homebrew/

# brew upgrade
chown -R $NEW_OWNER /usr/local/share/locale /usr/local/share/man/man6 /usr/local/share/man/man8
chmod u+w /usr/local/share/locale /usr/local/share/man/man6 /usr/local/share/man/man8
chown -R $NEW_OWNER /usr/local/Cellar
