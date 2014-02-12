# Simple Backup Script
# 2014 - Anastasios Karasakalidis

BACKUPDIR=$HOME/backup
DIR=$2

if [ $# != 2 ]
then
	echo "usage: $0 Option Directory/Backupfile"
	echo
	echo "Available options:"
	echo "save = Proceed with backup..."
	echo "read = Read a backupfile..."
	exit1
fi

if ls $BACKUPDIR > /dev/null
then
	echo "Backup directory ($BACKUPDIR) already exists..."
elif mkdir $BACKUPDIR > /dev/null
then
	echo "Backup directory ($BACKUPDIR) created..."
else
	echo "Can't create Backup directory..."
	exit1
fi

if [ "$1" = "save" ]
then
	set 'date'
	BACKUPFILE="$3$2$6"
	if tar czvf ${BACKUPDIR}/${BACKUPFILE}.tar $DIR
	then
		echo "Backup for $DIR succesfully in $BACKUPDIR saved..."
		echo "Backup-Name : ${BACKUPFILE}.tar"
	else
		echo "Backup not succesfully..."
	fi
elif [ "$1" = "read" ]
then
	echo "Content of $DIR : "
	tar tzf $DIR
else
	echo "Wrong script execution..."
	echo "usage: $0 option Directory/Backupfile"
	echo
	echo "Available options: "
	echo "save = performs a backup of an entire directory..."
	echo "directory is specified as the second argument..."
	echo "read = reads the contents of a backup file..."
	echo "backupfile is specified as the second argument..."
fi
