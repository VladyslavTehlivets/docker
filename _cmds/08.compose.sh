######### ORCHESTRATION - COMPOSE #########

# context (build from Dockerfiles)
# docker-cmpose-ctx.yml
docker-compose --file docker-compose-ctx.yml build
docker-compose --file docker-compose-ctx.yml up -d
docker-compose --file docker-compose-ctx.yml down

# images - wczesniej wymagene obrazy z 07: siata/api-app, siata/ng-app
# docker-compose.yml
docker-compose up -d
docker-compos down

# sieci
docker network ls
docker network inspect <net>