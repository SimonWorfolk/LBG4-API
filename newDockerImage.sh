#! /bin/bash
npm install
npm test

DOCKER_API=$(docker images "lbg4-api" --format "{{.Repository}}")
DOCKER_RUN=$(docker ps -a -f ancestor=$DOCKER_API --format "{{.Names}}")
CONTS=$DOCKER_RUN
PORT=5000

cd /home/simon_worfolk/LBG4-API

if [ $DOCKER_API ]; then
echo "image already exists - removing now"
#else
#echo "new image needs to be built" 
fi

#if [ $DOCKER_RUN ];
#then
for val in $DOCKER_RUN; do
docker stop $val
docker rm $val }
done
docker rmi $DOCKER_API

#cd /home/simon_worfolk/LBG4-API
#docker build -t lbg4-api .
#echo "new image built"
#else
#cd /home/simon_worfolk/LBG4-API
#docker build -t lbg4-api
#echo "new image built"
#fi
#fi
docker build -t $DOCKER_API .

docker run -d -p $PORT:$PORT --name lbg4-api lbg4-api
echo "new container started"
