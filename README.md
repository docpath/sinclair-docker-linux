# Docker Configuration Files for DocPath Sinclair Pack

This is a complete example about how to deploy DocPath ® Sinclair Pack in Linux using Docker. The example must be completed with the following files in the same directory as the repositorized files:

- `dpsinclair-installer-6.X.Y.jar`: DocPath ® Sinclair Pack Installer.
- `DocPath_License_File.olc`: License file.
 
## Steps 
To successfully perform the example, follow the steps as indicated below:
- Use the `openjdk:8` image. This is a Linux Debian image with OpenJDK 8 pre-installed.
- Install DocPath ® Sinclair Pack.
- Copy the license file into the image.
- Use port 1806 to receive generation requests.
- Run the `run.sh` file on the container entrypoint. `run.sh` is performed as follows:
  - Starts the license server to allow DocPath ® Sinclair Pack execution.
  - Deploys DocPath ® Sinclair Pack.

## Necessary changes
- Change the `dpsinclair-installer-6.X.Y.jar` with the corresponding version of DocPath ® Sinclair Pack.
- Change the `DocPath_License_File.olc` file with the corresponding license filename.

## How to build and deploy
Now we are going to build the container by executing the following sentence in the same directory where the dockerfile file is located:

`docker build -t docpath/sinclair .`

**IMPORTANT!** the full stop at the end indicates the directory where the container is located. This is mandatory.

In the installation, the following values has been taken by default:
- -solution **/usr/local/docpath/sinclair_pack/sinclair**
- -licserverpath **/usr/local/docpath/licenseserver**
- -licserverport**1765**
- -databasecheckconnection**false**

Run the container once it has been built, using the following sentence:

`docker run -p 1806:1806 --hostname sinclair --name sinclair --detach -e DP_DB_HOST=<db_ip> -e DP_DB_PORT=<db_port> -e DP_DB_USER=<db_user> -e DP_DB_PASS=<db_pass> -e DP_DB_NAME=<db_name> -e DP_WORKINGDIRECTORY="/usr/local/docpath/sinclair_pack/workingdirectory/" -e DP_URLAIM=<url_aim> -e DP_APPLICATIONTOKEN=<application_token> docpath/sinclair`

The used parameters are:

- `--name`: this parameter indicates the name of the container, in this case sinclair.
- `--hostname`: this parameter indicates the hostname of the machine with the license.
- `--detach`: this parameter indicates that no messages are displayed in the execution console, silent mode.
- `-p 1806:1806`: this parameter indicates the port of both host machine and Sinclair.
- `docpath/sinclair`: this is the name assigned previously while building the container.
- `db_ip`: Host of the database.
- `db_port`: Port of the database.
- `db_user`: User with privileges to connect to the database.
- `db_pass`: Password of the user with privileges.
- `db_name`: Name of the database or schema where Sinclair is installed.
- `url_aim`: Address to connect with Access and Identity Management (AIM).
- `application_token`: Application Token of Sinclair in Access and Identity Management (AIM).
