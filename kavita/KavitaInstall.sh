#!/bin/bash
usage()
{
    printf "Usage: %s [ -i | -u ] \n" ${0##*/}
    printf "[-i]: init Kavita mounting directory at first time.\n"
    printf "[-u]: only update && deploy.\n"
}

no_args="true"
while getopts ":iu" opt;
do
    case "$opt" in
        i)
            sudo mkdir manga && sudo mkdir data
            sudo mkdir books && sudo mkdir papers && sudo mkdir comics
            echo "init kavita volume at first time. then start kavita."
            sudo docker compose pull && sudo docker compose up -d
            ;;
        u)
            sudo docker compose pull && sudo docker compose up -d
            echo "update & start kavita"
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