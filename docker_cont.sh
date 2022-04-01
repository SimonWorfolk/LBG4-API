#! /bin/bash
npm install
npm test

docker -v
export PORT=5000

echo $?

if echo $? = 0; 

then
    echo "docker already installed"
else

curl https://get.docker.com | sudo bash
sudo usermod -aG docker $(whoami)

fi

cd /home/simon_worfolk/LBG4-API

DOCKER_API=$(docker images "lbg4-api" --format "{{.Repository}}")
DOCKER_RUN=$(docker ps -a -f name=lbg4-api --format "{{.Image}}")

if [ $DOCKER_API ];then
echo "Image already built"
else 

 docker build -t lbg4-api .
echo "New image built"
fi

if [ $DOCKER_RUN ];
then
 
 docker start lbg4-api
echo "existing docker container started"
else

docker run -d -p $PORT:$PORT --name lbg4-api lbg4-api
echo "new docker container started" 
fi
