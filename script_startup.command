#!/bin/sh

####################################################
# STARTUP SCRIPT ###################################
####################################################

BASE_DIR="Sites/" # dir where server is located

printDir() {
	echo 'var is:'
	echo $PWD/$BASE_DIR
	sleep 10

}



getFiles() {
	
WGET_OUTPUT=$(2>&1 wget -v -m -nd -A.jpg -N -P $PWD/$BASE_DIR/clock http://www.exquisiteclock.org/v1/adm/installation/clock/)

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
	
WGET_OUTPUT=$(2>&1 wget -m -nd -N -P $PWD/$BASE_DIR/feeds http://www.exquisiteclock.org/clock/feed/feed.json )

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
	open $PWD/$BASE_DIR/exquisite_client_final.app
	sleep 1
	#sh $PWD/$BASE_DIR'script_update.sh' # ENABLE ONLY IF CLOCK NEEDS TO BE REAL TIME
fi
}


#getJson
getFiles