#!/bin/bash
usage()
{
  printf "Usage: %s [ -i | -u ] \n" ${0##*/}
  printf "[-i]: init focalboard, cp config json from the origin image\n"
  printf "[-u]: deploy && pull && update \n"
}

noargs="true"
while getopts ":iu" opt;
do
  case "$opt" in
    i)
      sudo docker run -d --name focalboard-config mattermost/focalboard:latest
      sudo docker cp focalboard-config:/opt/focalboard/config.json ./
      sudo docker rm -f focalboard-config
      sudo docker compose pull && sudo docker compose up -d
      echo "excute init && cp config file."
      ;;
    u)
      sudo docker compose pull && sudo docker compose up -d
      echo "excute deploy && update"
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
  noargs="false"
done

[[ "$noargs" == "true" ]] && { usage; exit 1; }
