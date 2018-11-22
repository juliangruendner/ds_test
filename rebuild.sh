docker build -f Dockerfile.ds_test -t ds_test .
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d