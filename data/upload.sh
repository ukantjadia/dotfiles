#!/bin/bash - 
#===============================================================================
#
#          FILE: upload.sh
# 
#         USAGE: ./upload.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 06/14/2022 12:57
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

function upmenu {
        options="Upload a File\nRecent Uploads\nCancel"
        selected=$(echo -e $options | dmenu -l 3)
    if [[ "$selected" == "Upload a File" ]];then

        target=$1
        [ -z "$target" ] && target="$(realpath .)"

        ls() {
            echo ..
            command ls -ALNpX1 --group-directories-first "$target"
        }
    while :; do
            sel="$(ls | dmenu -l 20)" || exit 
            if [ "$(echo "$sel")" = "/" ]; then
                newt="$sel"
            else
                newt="$(realpath "$target/$sel")"
            fi
            if [ -e "$newt"  ]; then
                target="$newt"
                if [ ! -d "$target" ]; then 
                    echo "Location: $target"
                command="curl -s -F'file=@$target' https://0x0.st"
                    echo "Executing: $command"

                    url=$(eval $command)
                    echo "URL: $url"

                    printf "$url" | xclip -sel clip 
                    notify-send "File Uploaded" "URL: $url \ncopied to clipboard" -t 5000 -i "$HOME/script/icon.png"

                    entry="$(date '+%d/%m/%y-%H:%M:%S')    $url   $(echo $target | awk -F / '{print $(NF)}')"
                    echo $entry >> $HOME/.local/0x0.list
                    echo "Uploaded"; break
                fi
            fi
    done
    elif [[ "$selected" == "Recent Uploads" ]]; then
        var=$(tac ~/.local/0x0.list | dmenu -l 10)
        filename=$(echo $var | awk '{print $3}')
        url=$(echo $var | awk '{print $2}')
        printf "$url" | xclip -sel clip
        notify-send "$filename" "URL: $url   \ncopied to clipboard" -t 5000 -i "$HOME/scripts/icon.png"
    elif [[ "$selected" == "Cancel" ]]; then
        return 
    fi
}

upmenu
