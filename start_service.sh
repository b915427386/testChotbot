
#!/bin/bash
cd /home/ec2-user/deploy
echo "Running service container "
docker-compose -f $vision/docker-compose.yml up -d
echo "Testing service container "
docker ps > /home/es2-user/container_log
containerNum=cat /home/es2-user/container_log|wc -l
for ((i=0;i<3;i++))
do
  sleep 5
  if [$containerNum==6];then
    echo "remove image second "
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:$pvision
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:$pvision
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:$pvision
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:$pvision
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:$pvision
  fi
done
