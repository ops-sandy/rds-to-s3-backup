#!/bin/bash
<<<<<<< Updated upstream:scripts/rdstos3backup.sh
# Simple script to backup mysql data to s3 bucket.
=======
# script to take backup from RDS to S3
>>>>>>> Stashed changes:scripts/awsrdstos3backup.sh
BACKUP_DATE=$(date +"%Y-%m-%d")
BACKUP_OPTIONS="--rr"
BACKUP_S3PATH='s3://bucketname/folder'
for db in $(mysql -N -s -r -e 'show databases' | grep -v information_schema | grep -v performance_schema | grep -v mysql | grep -v innodb); do
	echo "Creating DB Backup: $db"
	/usr/bin/mysqldump "$db" | /bin/gzip | /usr/bin/s3cmd "$BACKUP_OPTIONS" put - "$BACKUP_S3PATH"/"$BACKUP_DATE"/"$db".sql.gz >/dev/null 2>&1
done
echo "Done"
