######### RUN #########

docker run hello-world

# mongo standardowo exposuje port 27017
docker run -d mongo

docker run -d --name mongo-latest mongo

docker run -d --name mongo-32 mongo:3.2

# postgres nie exposuje portu by default + zmienne
docker run --name mypostgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres


