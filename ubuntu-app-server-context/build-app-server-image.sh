
LOG_SERVER_NAME=""

while getopts l: flag
do
    case "${flag}" in
        l) LOG_SERVER_NAME=${OPTARG};;
    esac
done

if [ -z $LOG_SERVER_NAME ]
then
	echo "Expected log server name as -l flag e.g. ' -l the-log-server '"
	exit 1
fi
echo "Building rsyslog-sender.conf file with LOG_SERVER_NAME=$LOG_SERVER_NAME"
sed "s/LOG_SERVER_NAME/$LOG_SERVER_NAME/g" rsyslog-sender.template > rsyslog-sender.conf
echo "Building image"
docker build -t ubuntu-app-server:latest .