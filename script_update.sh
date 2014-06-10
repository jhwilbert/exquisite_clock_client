#!/bin/sh


getTxt() {
	
WGET_OUTPUT=$(2>&1 wget -m -nd -N	-P  "$PWD"'/feeds' http://www.exquisiteclock.org/clock/feed/wgetfeed.txt )

# Make sure the download went okay.
if [ $? -ne 0 ]
then

	# wget had problems.
	echo 1>&2 $0: "$WGET_OUTPUT"  Exiting.
	echo "$WGET_OUTPUT" | mail -s "ERROR downloading wget txt file" jhwilbert@gmail.com
	exit 1
else 
	echo "Getting files..."
	echo "$WGET_OUTPUT"
	getFiles	
fi
}


getFiles() {
	
WGET_OUTPUT=$(2>&1 wget -N -i "$PWD"/feeds/wgetfeed.txt -P "$PWD"'/clock' )

# Make sure the download went okay.
if [ $? -ne 0 ]
then

	# wget had problems.
	echo 1>&2 $0: "$WGET_OUTPUT"  Exiting.
	echo "$WGET_OUTPUT" | mail -s "ERROR downloading wget image files" jhwilbert@gmail.com
	exit 1
else 
	echo "Getting json..."
	echo "$WGET_OUTPUT"
	sleep 2
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
	echo "$WGET_OUTPUT"
	echo "Done!"
fi
}



# RUNS THE ROUTINE
while true; do
	
getTxt
sleep 5

done



