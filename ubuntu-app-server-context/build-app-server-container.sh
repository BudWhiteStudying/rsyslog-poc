
if [ -z $1 ]
then
	echo "container name expected as parameter 1"
	exit 1
else
	if [ -z $2 ]
	then
		echo "port number expected as parameter 2"
		exit 1
	else
		docker run --privileged -it --name $1 --network-alias $1 --network logs-network -p 127.0.0.1:$2:$2 --privileged ubuntu-app-server
	fi
fi
