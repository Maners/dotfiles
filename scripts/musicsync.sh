#!/bin/bash

REMOTE="maners@triton.usbx.me:media/Music/"
LOCAL="$HOME/Music/"
DELETE=""

while getopts "dueh" OPTION; do
    case $OPTION in
        d)
            SOURCE=$REMOTE
            DESTINATION=$LOCAL
            ;;
        u)
            SOURCE=$LOCAL
            DESTINATION=$REMOTE
            ;;
        e)
            DELETE=" --delete"
            ;;
        h)
            echo -e "Sync music to/from remote server, options:"
            echo -e "   -d - download to local machine"
            echo -e "   -u - upload to remote machine"
            echo -e "   -e - delete differeces on destination"
            exit 0
            ;;
        *)
            echo -e "Invalid option provided, use -h for help"
            exit 1
            ;;
    esac
done

rsync -av --progress$DELETE -e "ssh" $SOURCE $DESTINATION

exit 0;
