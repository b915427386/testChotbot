
#!/bin/bash
echo "stop service container "
pversion=`cat VERSION|cut -d ';' -f 2`
version=`cat VERSION|cut -d ';' -f 1`
docker_compose_file="$pvision/docker-compose.yml"
echo "remove container "
docker-compose -f $docker_compose_file rm -sf
echo "re-tag image "
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:$pvision
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:$pvision
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:$pvision
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:$pvision
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:$pvision
echo "remove image first "
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
