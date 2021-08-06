FROM openjdk:8

RUN apt-get update && apt-get install -y apt-transport-https apt-utils lib32stdc++6 gcc-multilib procps wait-for-it
RUN mkdir /required_files
COPY dpsinclair-installer-6.X.Y.jar /required_files/
WORKDIR /required_files
RUN java -jar dpsinclair-installer-6.X.Y.jar -solname"DocPath Sinclair" -install -solution"/usr/local/docpath/sinclair_pack/sinclair" -silentmode -console -licserverpath"/usr/local/docpath/licenseserver" -licserverport1765 -databasecheckconnectionfalse
WORKDIR /
COPY licenseserver.ini /usr/local/docpath/licenseserver/licenseserver/Configuration/
COPY DocPath_License_File.olc /usr/local/docpath/Licenses/
RUN rm -rf /usr/local/docpath/sinclair_pack/sinclair/configuration/dpsinclair-db.xml
COPY run.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/run.sh
RUN rm -rf /usr/local/docpath/sinclair_pack/sinclair/configuration/dpsinclair.ini
RUN rm -rf /required_files
VOLUME ["/usr/local/docpath/sinclair_pack/workingdirectory/"]
EXPOSE 1806
ENTRYPOINT ["/usr/local/bin/run.sh"]

