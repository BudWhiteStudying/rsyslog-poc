

while true
	do
		sleep 2
		echo "I am the fake application and I'm logging something"
		echo "I am the fake application and I'm logging something" >> ./logs/app-log.log
		sleep 2
		echo "I am the fake application and I'm logging something else"
		echo "I am the fake application and I'm logging something else" >> ./logs/app-log.log
	done