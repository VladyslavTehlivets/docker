######### miscellaneous #########

# build image from git repo
docker build https://gitlab.com/k.siatka/docker.git#master:api-app -t siata/api-app-git

# portainer
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer --no-auth

# docker cloud