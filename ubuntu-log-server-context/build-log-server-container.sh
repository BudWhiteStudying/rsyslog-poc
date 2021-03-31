
CONTAINER_NAME=""
CONTAINER_PORT=""
NETWORK_NAME=""

while getopts n:p:w: flag
do
    case "${flag}" in
        n) CONTAINER_NAME=${OPTARG};;
        p) CONTAINER_PORT=${OPTARG};;
		w) NETWORK_NAME=${OPTARG};;
    esac
done

if [ -z $CONTAINER_NAME ]
then
	echo "Expected container name as -n flag e.g. ' -n my-server '"
	exit 1
fi
if [ -z $CONTAINER_PORT ]
then
	echo "Expected container port as -p flag e.g. ' -p 10000 '"
	exit 1
fi
if [ -z $NETWORK_NAME ]
then
	echo "Expected network name as -w flag e.g. ' -w my-network '"
	exit 1
fi



docker run -it --name $CONTAINER_NAME -h $CONTAINER_NAME --network-alias $CONTAINER_NAME --network $NETWORK_NAME -p $CONTAINER_PORT:$CONTAINER_PORT --privileged ubuntu-log-server
