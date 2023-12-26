#!/bin/bash
usage()
{
    printf "Usage: %s [ -i | -u ] \n" ${0##*/}
    printf "[-i]: init vaultwarden which allow regiest at first time.\n"
    printf "[-u]: only update && deploy.\n"
}

no_args="true"
while getopts ":iu" opt;
do
    case "$opt" in
        i)
            sed -i "/SIGNUPS_ALLOWED/ s/false/true/g" docker-compose.yml
            sudo docker compose pull && sudo docker compose up -d
            ;;
        u)
            sudo docker stop bitwarden
            sed -i "/SIGNUPS_ALLOWED/ s/true/false/g" docker-compose.yml
            sudo docker compose pull && sudo docker compose up -d
            echo "restart vaultwarden"
        exit 0;;

        :)
            usage
            exit 1
            ;;
        \?)
            usage
            exit 1
            ;;
    esac
    no_args="false"
done

[[ "$no_args" == "true" ]] && { usage; exit 1; }