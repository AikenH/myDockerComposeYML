ort=$1
docker run -d -p $1:5566  -v ~/melody-profile:/app/backend/.profile foamzou/melody:latest
