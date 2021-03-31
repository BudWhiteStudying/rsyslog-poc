EXECUTION_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "start-poc.sh running in directory $EXECUTION_DIR"

LOG_SERVER_DIR="./ubuntu-log-server-context"
APP_SERVER_DIR="./ubuntu-app-server-context"

LOG_SERVER_NAME=""
NETWORK_NAME=""

while getopts c:l:w:p: flag
do
    case "${flag}" in
    	c) CONTAINERS+=(${OPTARG});;
		l) LOG_SERVER_NAME=${OPTARG};;
		w) NETWORK_NAME=${OPTARG};;
		p) LOG_SERVER_PORT=${OPTARG};;
    esac
done
shift $((OPTIND -1))

if [ -z $CONTAINERS ]
then
	echo "Expected at least one app server container name through option -c flag e.g. ' -c app1 app2 '"
	exit 1
fi

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

echo "entering log server directory $LOG_SERVER_DIR and executing build script"
cd $LOG_SERVER_DIR
./build-log-server.sh -l $LOG_SERVER_NAME -w $NETWORK_NAME

echo "back to starting execution directory $EXECUTION_DIR"
cd $EXECUTION_DIR

echo "entering app server directory $APP_SERVER_DIR"
cd $APP_SERVER_DIR
echo "assembling app servers build command"
BASE_COMMAND="./build-app-server.sh"
BUILD_COMMAND=$BASE_COMMAND
for CONTAINER_NAME in "${CONTAINERS[@]}"; do
	BUILD_COMMAND+=" -c $CONTAINER_NAME"
done
BUILD_COMMAND+=" -l $LOG_SERVER_NAME -w $NETWORK_NAME"
echo "executing $BUILD_COMMAND"
eval "$BUILD_COMMAND"
exit 0