# RDS to S3 Backup Script

This simple script dumps the data out of the RDS straight to Amazon
AWS S3 using the `s3cmd` and the native `mysqldump` that comes with Ubuntu.
Steps to install and configure are listed below.

## Install Prerequisites

This install assumes you are on an amazon ec2 instance running ubuntu 16.04.
If this is not the case you may use this as a guide to install via your
favorite flavor of Linux.

- `$ sudo apt-get install -y s3cmd`
- `$ sudo apt-get install -y mysql-client-5.6`

## Configuration

First get your EC2 to connect by default to the RDS.  This can be done with a
simple file placed at `~/.my.cnf`.  A sample of this file is located in the
samples folder in this git repo.  After this is done configure your s3cmd
using `s3cmd --configure`.  You will need your IAM info for s3 at this point.

Last edit the rdstos3backup.sh script and edit the top few lines to suite your
needs.  For example you might not want --rr because you may want more
redundancy.  Fix to suite your needs and then save the file in
`/usr/local/bin/`.

## Crontab

Optionally you might want to put this script in a crontab to run every night.
You can achieve this by using the folllowing crontab:

```
*    3    *    *    *   /usr/local/bin/rdstos3backup.sh 1>/dev/null >&2
```
