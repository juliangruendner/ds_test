docker-compose up -d

ADMIN=administrator
PASS=password

# upload the needed csv files
docker exec ds_test sh -c 'opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/LifeLines.sav /projects'

# import the needed csv files to the test project
docker exec ds_test sh -c "opal import-spss --opal https://datashield_opal:8443 -u $ADMIN -p $PASS --destination test --path /projects/LifeLines.sav"

#docker-compose stop




opal dict --opal https://datashield_opal:8443 -u administrator -p password

opal dict --opal https://datashield_opal:8443 -u administrator -p password test

opal rest --opal https://datashield_opal:8443 -u administrator -p password -m GET -j /system/databases
opal rest --opal https://datashield_opal:8443 -u administrator -p password -m GET -j /projects

opal rest --opal https://datashield_opal:8443 -u administrator -p password -v -m POST /projects '{ "name": "test","title": "test","datasource" : {"name": "test", "type": "mongodb"}}'

- this works
opal rest --opal https://datashield_opal:8443 -u administrator -p password --content-type 'application/json' -m POST /projects <<< '{"name":"test123","title":"test133"}'

opal rest --opal https://datashield_opal:8443 -u administrator -p password --content-type 'application/json' -m POST /system/databases <<< '{"name":"test","defaultStorage":false, "usage": "STORAGE", "usedForIdentifiers":true, "mongoDbSettings" : {"url":"mongodb://datashield_mongo:27017/opal_ids"}}'
opal rest --opal https://datashield_opal:8443 -u administrator -p password --content-type 'application/json' -m POST /system/databases <<< '{"name":"test","defaultStorage":false, "usage": "STORAGE", "mongoDbSettings" : {"url":"mongodb://datashield_mongo:27017/opal_data"}}'

opal rest --opal https://datashield_opal:8443 -u administrator -p password -m GET /system/databases 




docker exec ds_test sh -c "opal rest --opal https://datashield_opal:8443 -u administrator -p password --content-type 'application/json' -m POST /system/databases " | echo '{"name":"test","defaultStorage":false, "usage": "STORAGE", "mongoDbSettings" : {"url":"mongodb://datashield_mongo:27017/opal_data"}}'


echo '{"name":"testbuhu","defaultStorage":false, "usage": "STORAGE", "mongoDbSettings" : {"url":"mongodb://datashield_mongo:27017/opal_data"}}' | docker exec --interactive ds_test sh -c "opal rest --opal https://datashield_opal:8443 -u administrator -p password --content-type 'application/json' -m POST /system/databases "

opal rest --opal https://datashield_opal:8443 -u $ADMIN -p password --content-type 'application/json' -m POST /system/databases <<< '{"name":"testbuhu","defaultStorage":false, "usage": "STORAGE", "mongoDbSettings" : {"url":"mongodb://datashield_mongo:27017/opal_data"}}'


echo 'buhu' | docker exec ds_test sh -
mongodb

opal rest --opal https://datashield_opal:8443 -u administrator -p password  --content-type 'application/json' -v -m POST /projects <<< '{ "name": "test","title": "test","datasource" : {"name": "test", "type": "mongodb"}}'