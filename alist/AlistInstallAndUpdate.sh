#!/bin/bash
usage()
{
    printf "Usage: %s [ -i | -u | -h ]\n" "${0##*/}"
    printf "[-i] init or install it first time. which will create dir to mount \n"
    printf "[-u] just deploy & pull update & restart alist container \n[-h] means help which will print usage again \n"
}

no_args="true"
while getopts ":iuh" opt; #
do
    case "$opt" in
        i) 
            sudo mkdir -p ./data/temp/aria2
            sudo docker compose pull && sudo compose up -d
            echo "excute in it command, will create aria first time"
            ;;
        u)
            sudo docker compose pull && sudo compose up -d
            echo "excute update command, just pull and restart container"
            ;;
        h)
            usage
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
