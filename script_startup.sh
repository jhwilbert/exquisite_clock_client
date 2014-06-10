#!/bin/sh

printDir() {
    echo "$PWD"'/exquisite_client_final.app'
}

getFiles() {
	
WGET_OUTPUT=$(2>&1 wget -v -m -nd -A.jpg -N -P "$PWD"'/clock' http://www.exquisiteclock.org/v1/adm/installation/clock/)

# Make sure the download went okay.
if [ $? -ne 0 ]
then
	# wget had problems.
	echo 1>&2 $0: "$WGET_OUTPUT"  Exiting.
	echo "$WGET_OUTPUT" | mail -s "ERROR downloading wget all image files on restart" jhwilbert@gmail.com
	exit 1
else 
	echo 1>&2 $0: "$WGET_OUTPUT"  Exiting.
	rm ~/exquisiteclock/clock/index.html.2
	getJson	
fi

}

getJson() {
	
WGET_OUTPUT=$(2>&1 wget -m -nd -N -P "$PWD"'/feeds' http://www.exquisiteclock.org/clock/feed/feed.json )

# Make sure the download went okay.
if [ $? -ne 0 ]
then
	# wget had problems.
	echo 1>&2 $0: "$WGET_OUTPUT"  Exiting.
	echo "$WGET_OUTPUT" | mail -s "ERROR downloading wget json file" jhwilbert@gmail.com
	exit 1
else 
	echo 1>&2 $0: "$WGET_OUTPUT"
	echo "Done!"
	sleep 2
	open "$PWD"'/exquisite_client_final.app'
	sleep 1
	"$PWD"'/constantupdate.sh'
fi
}


getFiles