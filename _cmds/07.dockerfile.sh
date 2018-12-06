######### DOCKERFILE #########

# api-app
cd api-app

docker build -t siata/api-app .

# nie ma --name, automat
docker run -p 3333:3333 -d siata/api-app

# 192.168.43.132
docker run -p 3333:3333 -e MONGO_HOST=mongodb://10.0.100.21:27017/ -e MONGO_DB_NAME=mydatabase -d siata/api-app

# ng-app (2-stage build)
cd ng-app

docker build -t siata/ng-app .

# nie ma --name, automat
docker run -p 7000:80 -d siata/ng-app