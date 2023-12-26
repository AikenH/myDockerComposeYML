# File Name: install_memos.sh
docker run -d --name memos -p 15280:5230 -v ~/.memos/:/var/opt/memos ghcr.io/usememos/memos:latest
