if [ $# -eq 1 ]
then 
	user=`who | grep -woi "$1"`
	if [ $? -eq 0 ]
	then
		if [ "$user" = `whoami` ]
		then
			currentHour=`date +%H`
			currentMinute=`date +%M`
			currentUser=`whoami`
			set -- `who | grep $currentUser`
			set -- `echo $4 | tr ":" " "`
			loginHour=$1
			loginMinute=$2
			hours=`expr $currentHour - $loginHour`
			minutes=`expr $currentMinute - $loginMinute`
			if [ $minutes -lt 0 ]
			then
				minute=`expr $minutes + ($minutes*(-2))`
			fi
			echo The user `whoami` working time is $hours hours $minutes minutes
		fi
	else
		echo $user not loggedin
	fi
else
	echo $user does not exist
fi
