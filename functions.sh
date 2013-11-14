#!/bin/bash

source ~/bin/config.sh

function prep {
    if [[ "$USE_SUDO" = "yes" ]]; then
        sudo ~/bin/prepare_backup
    else
        ~/bin/prepare_backup
    fi
}

# Example: backup full local remote
# Example: backup inc local remote
function backup {
    prep && duplicity $ENC_KEY_OPT $1 $2 "$REMOTE/$3"
}

# Example: verify remote local
function verify {
    duplicity verify $ENC_KEY_OPT "$REMOTE/$1" $2
}

# Example: restore remote local
# note the local directory must be empty
function restore {
    duplicity $ENC_KEY_OPT "$REMOTE/$1" $2
}

# Example: clean remote
# this will remove old backups
function clean {
    duplicity cleanup "$REMOTE/$1"
    duplicity remove-older-than 30D "$REMOTE/$1"
}

