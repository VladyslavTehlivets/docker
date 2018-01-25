######### BASIC COMMANDS #########

# ps
docker ps
docker ps -a
docker ps -f status=exited

# stats 
docker stats
docker stats --format "table{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.PIDs}}"

# logs 
docker logs <container>
docker logs -f <container>
docker logs --tail 100 <container>
docker logs <contaimer> 2>&1 | grep "search"

# start, stop, restart
docker stop monog-latest
docker stop <guid>
docker restart monog-latest

# remove
docker rm <guid>
docker rm --force <guid>

# images
docker images
docker images nginx
docker rmi <guid>

# pull
docker pull debian #latest
docker pull debian:jessie
docker pull --all-tags fedora #
docker pull packages01-internal.adstream.com/activemq/broker:latest

# exec - wykonuje komendę na działającym kontenerze
docker exec postgres pwd

# interactive mode
docker exec -it <container> bash