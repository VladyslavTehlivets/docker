######### COMMIT NEW IMAGE #########

# run nginx
docker run -d -p 8888:80 --name=nginxtest nginx:latest

# copy, go to src
docker cp index2.html nginxtest:/usr/share/nginx/html

# commit
docker commit <guid>  siata/nginxtest:1

# remove nginxtest
docker rm --force nginxtest

# new container
docker run -d -p 8887:80 --name=ngx siata/nginxtest:1

# login (mam konot na dockerhubie)
docker login 

# push image
docker push siata/nginxtest:1

# https://hub.docker.com/add/repository/