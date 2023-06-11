#!/bin/sh
set -e

COMMANDS=$(cat <<EOF
set sftp:connect-program "/usr/bin/sshpass -p '$INPUT_PASSWORD' /usr/bin/ssh -a -x -p '$INPUT_PORT'"
set net:max-retries 1
set net:persist-retries 0
open sftp://"$INPUT_USER":@"$INPUT_SERVER"
mirror --delete --reverse $INPUT_MIRROR_OPTIONS "$INPUT_LOCAL" "$INPUT_REMOTE"
EOF
           )

lftp -c "$COMMANDS"