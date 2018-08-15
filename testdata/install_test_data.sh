
# upload the needed csv files
opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM1.csv /projects
opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM2.csv /projects
opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM3.csv /projects


opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM.zip /projects

# import the needed csv files to the test project
opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM1.csv --separator , --type Participant
opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM2.csv --separator , --type Participant
opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM3.csv --separator , --type Participant



opal file --opal https://datashield_opal:8443 -u administrator -p password -up /testdata/CNSIM/CNSIM.zip /projects
opal import-csv --opal https://datashield_opal:8443 -u administrator -p password --destination test --path /projects/CNSIM3.csv --separator , --type Participant

opal import-xml --opal https://datashield_opal:8443 --user administrator --password password --path /projects/CNSIM.zip --destination test