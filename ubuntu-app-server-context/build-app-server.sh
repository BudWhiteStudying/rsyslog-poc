
LOG_SERVER_NAME=""
NETWORK_NAME=""

CONTAINERS_STARTING_PORT=10001

while getopts c:l:w: flag
do
    case "${flag}" in
        c) CONTAINERS+=(${OPTARG});;
		l) LOG_SERVER_NAME=${OPTARG};;
		w) NETWORK_NAME=${OPTARG};;
    esac
done
shift $((OPTIND -1))

if [ -z $CONTAINERS ]
then
	echo "Expected at least one container name through option -c flag e.g. ' -c container1 container2 '"
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

# build image
echo "building app server image with log server name $LOG_SERVER_NAME"
./build-app-server-image.sh -l $LOG_SERVER_NAME

# TODO: for loop
# build container
CONTAINER_PORT=$CONTAINERS_STARTING_PORT
for CONTAINER_NAME in "${CONTAINERS[@]}"; do
	echo "building app server container with name $CONTAINER_NAME, port $CONTAINER_PORT, network $NETWORK_NAME"
	./build-app-server-container.sh -n $CONTAINER_NAME -p $CONTAINER_PORT -w $NETWORK_NAME
	CONTAINER_PORT=$(($CONTAINER_PORT+1))
done