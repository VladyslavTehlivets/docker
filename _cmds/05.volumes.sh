######### VOLUMES #########

# list, create, inspect, delete
docker volume ls
docker volume create my-vol
docker volume inspect my-vol
docker volume rm my-vol

# not existing volume
docker run -d --name devtest -v myvol2:/app nginx:latest

# clean
docker stop devtest
docker rm devtest
docker volume rm myvol2

docker run -d -p 8888:80 --name=nginxtest -v nginx-vol:/usr/share/nginx/html nginx:latest

http://localhost:8888/

# bash inside
echo test > index.html

http://localhost:8888/ ctrl+f5

docker rm --force nginxtest

docker run -d -p 8888:80 --name=nginxtest -v nginx-vol:/usr/share/nginx/html nginx:latest

http://localhost:8888/

# clean
docker rm --force nginxtest
docker volume rm nginx-vol