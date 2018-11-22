# set opal admin and password
OPAL_ADMIN_PASS=${OPAL_ADMIN_PASS:='password'}
ADMIN='administrator'

printf "######################\n Initialising test project and installing the LifeLines Spss test data \n######################\n\n"

# create a test project
echo '{"name":"test","title":"test", "database": "test"}' | opal rest --opal https://datashield_opal:8443 -u $ADMIN -p $OPAL_ADMIN_PASS --content-type 'application/json' -m POST /projects

# upload the needed lifeLines files
opal file --opal https://datashield_opal:8443 -u $ADMIN -p $OPAL_ADMIN_PASS -up /testdata/LifeLines.sav /projects

# import the needed spss files to the test project
opal import-plugin --opal https://datashield_opal:8443 -u $ADMIN -p $OPAL_ADMIN_PASS --name opal-datasource-spss --config '/testdata/config_test.json' --destination test

# create a test user
opal user --opal https://datashield_opal:8443 --user $ADMIN --password $OPAL_ADMIN_PASS --add --name test --upassword test123
sleep 10
# give test user permission to access lifeLines table
opal perm-table --opal https://datashield_opal:8443 --user $ADMIN --password $OPAL_ADMIN_PASS --type USER --project test --subject test  --permission view --add --tables LifeLines

# give test user permission to use datashield
opal perm-datashield --opal https://datashield_opal:8443 --user $ADMIN --password $OPAL_ADMIN_PASS --type USER --subject test --permission use --add

# install datashield packages
opal rest --opal https://datashield_opal:8443 --user $ADMIN --password $OPAL_ADMIN_PASS -m POST '/datashield/packages?name=datashield'


printf "######################\n Finished configuring testdata for opal \n######################\n\n"