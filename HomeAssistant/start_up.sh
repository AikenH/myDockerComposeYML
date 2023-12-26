docker run -d --name homeassistant --privileged --restart=unless-stopped -e TZ=Asia/Shanghai -v ./data:/config --network=host -p 29030:8123 ghcr.io/home-assistant/home-assistant:stable
