docker-compose up -d

# upload the needed csv files
docker exec ds_test -c 'opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM1.csv /projects'
docker exec ds_test -c 'opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM2.csv /projects'
docker exec ds_test -c 'opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM3.csv /projects'


# import the needed csv files to the test project
docker exec ds_test -c 'opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM1.csv --separator , --type Participant'
docker exec ds_test -c 'opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM2.csv --separator , --type Participant'
docker exec ds_test -c 'opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM3.csv --separator , --type Participant'

docker-compose stop