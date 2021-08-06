#!/bin/bash

sinclairdb_file='/usr/local/docpath/sinclair_pack/sinclair/configuration/dpsinclair-db.xml'
database_host="${DP_DB_HOST}"
database_port="${DP_DB_PORT}"
database_user="${DP_DB_USER}"
database_pass="${DP_DB_PASS}"
database_name="${DP_DB_NAME}"

echo '<?xml version="1.0" encoding="UTF-8"?><configurations>  <activeDatabaseId>1</activeDatabaseId><database id="1">' >> "$sinclairdb_file"
echo "<databaseHost>$database_host</databaseHost>" >> "$sinclairdb_file"  
echo '<databaseWinAuth>false</databaseWinAuth>' >> "$sinclairdb_file"
echo "<databasePort>$database_port</databasePort>" >> "$sinclairdb_file" 
echo '<databaseType>MySQL</databaseType>' >> "$sinclairdb_file"
echo "<databaseUser>$database_user</databaseUser>" >> "$sinclairdb_file"
echo "<databasePass>$database_pass</databasePass>" >> "$sinclairdb_file"
echo "<databaseName>$database_name</databaseName>" >> "$sinclairdb_file"
echo '</database></configurations>' >> "$sinclairdb_file"

cat /usr/local/docpath/sinclair_pack/sinclair/configuration/dpsinclair-db.xml

sinclair_file='/usr/local/docpath/sinclair_pack/sinclair/configuration/dpsinclair.ini'
WorkingDirectory="${DP_WORKINGDIRECTORY-}"
urlaim="${DP_URLAIM-}"
ApplicationToken="${DP_APPLICATIONTOKEN-}"

echo '[LOG SERVICE]' >> "$sinclair_file"
echo 'LogFileName=dpsinclair.log' >> "$sinclair_file"
echo 'LogPort=1514' >> "$sinclair_file"
echo 'LogLevel=INFO' >> "$sinclair_file"
echo 'LogDelete=false' >> "$sinclair_file"
echo 'LogServer=127.0.0.1' >> "$sinclair_file"
echo 'LogLanguage=en-US' >> "$sinclair_file"
echo 'LogMode=FILE' >> "$sinclair_file"
echo 'LogMaxFiles=1' >> "$sinclair_file"
echo 'LogMaxSize=1024KB' >> "$sinclair_file"
echo '' >> "$sinclair_file"
echo '[MAIN]' >> "$sinclair_file"
echo 'AdminUsername=admin' >> "$sinclair_file"
echo 'AdminPassword=admin' >> "$sinclair_file"
echo '' >> "$sinclair_file"
echo '[PATHS]' >> "$sinclair_file"
echo "WorkingDirectory=$WorkingDirectory" >> "$sinclair_file"  
echo '' >> "$sinclair_file"
echo '[AIM]' >> "$sinclair_file"
echo "URL=$urlaim" >> "$sinclair_file"
echo "ApplicationToken=$ApplicationToken" >> "$sinclair_file"  


cat /usr/local/docpath/sinclair_pack/sinclair/configuration/dpsinclair.ini

cd /usr/local/docpath/licenseserver/licenseserver/Bin
./startServer.sh

cd /usr/local/docpath/sinclair_pack/sinclair
exec java -jar dpsinclair.war
