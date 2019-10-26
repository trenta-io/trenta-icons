#!/bin/sh
# From Arch Forum User MetaNova https://bbs.archlinux.org/viewtopic.php?id=190279

APPLICATION_PATH="/usr/share/applications"
USER_APPLICATION_PATH="${HOME}/.local/share/applications"

for FILE in `cat $1`; do
        if [ -e "${APPLICATION_PATH}/${FILE}" ]; then
                echo "Creating file ${USER_APPLICATION_PATH}/${FILE}"
                echo "NoDisplay=true" > "${USER_APPLICATION_PATH}/${FILE}"
        elif [ ! -e "${APPLICATION_PATH}/${FILE}" ] && [ -e "${USER_APPLICATION_PATH}/${FILE}" ]; then
                echo "Deleting unnecessary file ${USER_APPLICATION_PATH}/${FILE}"
                rm "${USER_APPLICATION_PATH}/${FILE}"
        fi
done
