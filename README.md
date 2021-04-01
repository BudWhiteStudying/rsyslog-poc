## rsyslog POC
This small Docker playground demonstrates the possibility to gather application logs 
on a dedicated "logs server".

Currently working on MacOS only.

Sample usage: `./start-poc.sh -c app1 -c app2 -l logs -w logs-network`

All above options are mandatory, and have the folllowing meaning:
- `-c` one or more names for as many sample app servers, each app server will be created 
with a fake application on it (a shell script merely echoing a string on a log file); 
names are used as container names and hostnames
- `-l` name of the logs server, used as container names and hostname
- `-w` name of the Docker network through which the sample servers shall communicate 
(TODO: should check for the existence of such a network, and if not existent create it)

The `start-poc.sh` script assumes that Docker is available and started. It creates one or 
more application servers, and a log server, and configures `rsyslog` on each of them so 
that the app servers send their application logs to the log server.

The log server listens on port `10000`, app servers do not actually neeed to listen to 
anything, but are configured to listen on ports `10001`, `10002` etc anyway.

Once the `start-poc.sh` script is done running, you may:
- `tail` the log file on the logs server
- start the `fake-application.sh` script on the app server(s)
- observe that all the app logs are sent to the logs server.