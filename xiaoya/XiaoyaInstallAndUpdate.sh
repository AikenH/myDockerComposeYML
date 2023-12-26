usage()
{
    printf "Usage: %s [ -i  | -h ] \n" ${0##*/}
    printf "[-i]: install & update xiaoya.\n"
    printf "[-h]: install host mode xiaoya.\n"
    printf "[-u]: only update && deploy.\n"
    printf "If you need help or you don't know what to prepare for, view official documentation at https://xiaoyaliu.notion.site/xiaoya-docker-69404af849504fa5bcf9f2dd5ecaa75f"
}

no_args="true"
while getopts ":iuh" opt;
do
    case "$opt" in
        i)
            sudo bash -c "$(curl http://docker.xiaoya.pro/update_new.sh)"
            echo "install && update xiaoya."            
            ;;
        h)
            sudo bash -c "$(curl http://docker.xiaoya.pro/update_new.sh)" -s host
            echo "install && update host mode xiaoya."  
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