
#!/bin/bash
cd /home/ec2-user/deploy
version=`cat VERSION|cut -d ';' -f 1`
echo "Running service container "
docker-compose -f $version/docker-compose.yml up -d
echo "Testing service container "
touch /home/ec2-user/containerLog
sudo docker ps > /home/ec2-user/containerLog
containerNum=`cat /home/ec2-user/containerLog|wc -l`
for ((i=0;i<3;i++))
do
  sleep 5
  if [ $containerNum == 6 ];then
    echo "remove image second "
    pversion=`cat VERSION|cut -d ';' -f 2`
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:$pversion
    break
  fi
done

