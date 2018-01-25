######### COPY #########

docker exec -it a5dockerize_mongo_1 bash
mongodump  --db public-api --collection applications
exit

# copy container:src dest
docker cp a5dockerize_mongo_1:/dump/public-api .

docker cp <file|folder> container:path