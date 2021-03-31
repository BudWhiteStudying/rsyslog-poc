
EXECUTION_DIR="$(cd "$(dirname "$0")" && pwd)"

DEFAULT_LOG_SERVER_PORT=10000
LOG_SERVER_NAME=""
NETWORK_NAME=""
LOG_SERVER_PORT=$DEFAULT_LOG_SERVER_PORT

while getopts l:w:p: flag
do
    case "${flag}" in
		l) LOG_SERVER_NAME=${OPTARG};;
		w) NETWORK_NAME=${OPTARG};;
		p) LOG_SERVER_PORT=${OPTARG};;
    esac
done
shift $((OPTIND -1))

if [ -z $LOG_SERVER_NAME ]
then
	echo "Expected log server name as -l flag e.g. ' -l the-log-server '"
	exit 1
fi
if [ -z $NETWORK_NAME ]
then
	echo "Expected network name as -w flag e.g. ' -w my-network '"
	exit 1
fi

# build image
echo "building log server image with log server port $LOG_SERVER_PORT"
./build-log-server-image.sh -p $LOG_SERVER_PORT

# build container
CONTAINER_CREATION_COMMAND="cd "$EXECUTION_DIR";./build-log-server-container.sh -n "$LOG_SERVER_NAME" -p "$LOG_SERVER_PORT" -w "$NETWORK_NAME
echo "building log server container with name $LOG_SERVER_NAME, port $LOG_SERVER_PORT, network $NETWORK_NAME"
echo "build commmand $CONTAINER_CREATION_COMMAND"
osascript -e 'tell app "Terminal" to do script "'"$CONTAINER_CREATION_COMMAND"'"'