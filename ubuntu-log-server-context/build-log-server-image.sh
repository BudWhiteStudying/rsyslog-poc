
LOG_SERVER_PORT=""

while getopts p: flag
do
    case "${flag}" in
        p) LOG_SERVER_PORT=${OPTARG};;
    esac
done

if [ -z $LOG_SERVER_PORT ]
then
	echo "Expected log server port as -p flag e.g. ' -p 10000 '"
	exit 1
fi
echo "Building rsyslog-aggregator.conf file with LOG_SERVER_PORT=$LOG_SERVER_PORT"
sed "s/LOG_SERVER_PORT/$LOG_SERVER_PORT/g" rsyslog-aggregator.template > rsyslog-aggregator.conf
echo "Building image"
docker build -t ubuntu-log-server:latest .