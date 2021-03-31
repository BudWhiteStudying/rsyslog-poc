Sample usage: start-poc.sh running in directory /Users/tom/Documents/tools/docker/rsyslog-poc
entering log server directory ./ubuntu-log-server-context and executing build script
building log server image with log server port 10000
Building rsyslog-aggregator.conf file with LOG_SERVER_PORT=10000
Building image
building log server container with name logs, port 10000, network logs-network
build commmand cd /Users/tom/Documents/tools/docker/rsyslog-poc/ubuntu-log-server-context;./build-log-server-container.sh -n logs -p 10000 -w logs-network
tab 1 of window id 45099
back to starting execution directory /Users/tom/Documents/tools/docker/rsyslog-poc
entering app server directory ./ubuntu-app-server-context
assembling app servers build command
executing ./build-app-server.sh -c app1 -c app2 -l logs -w logs-network
building app server image with log server name logs
Building rsyslog-sender.conf file with LOG_SERVER_NAME=logs
Building image
building app server container with name app1, port 10001, network logs-network
build commmand cd /Users/tom/Documents/tools/docker/rsyslog-poc/ubuntu-app-server-context;./build-app-server-container.sh -n app1 -p 10001 -w logs-network
tab 1 of window id 45101
building app server container with name app2, port 10002, network logs-network
build commmand cd /Users/tom/Documents/tools/docker/rsyslog-poc/ubuntu-app-server-context;./build-app-server-container.sh -n app2 -p 10002 -w logs-network
tab 1 of window id 45103
Sample usage: `./start-poc.sh -c app1 -c app2 -l logs -w logs-network -p 10000`
