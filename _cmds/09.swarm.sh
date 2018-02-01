######### SWARM #########

# init the swarm
docker swarm init

# deploy our stack
docker stack deploy -c docker-compose-swarm.yml ksswarm

# check services
docker service ls
docker service ps ksswarm_ngapp
docker service ps ksswarm_apiapp
docker container ls -q

# stop ksswarm
docker stack rm ksswarm

# take down the swarm
docker swarm leave --force
