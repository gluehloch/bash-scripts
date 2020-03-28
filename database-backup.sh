#!/bin/bash

# boprod@tippdiekistebier.de
rsync --delete -avzbe ssh mariadb.tdkb2:~/backup ~/tippdiekistebier

databaseImport() {
    NEWEST_BACKUP_FILE=$(ls -t ~/tippdiekistebier/backup/$1* | head -1)
    IMPORT_FILE=${NEWEST_BACKUP_FILE%.*}

    echo "Start gunzip of $NEWEST_BACKUP_FILE"
    gunzip  "$NEWEST_BACKUP_FILE"

    echo "Import to mysql $NEWEST_BACKUP_FILE%.*"
    # Virtual Box | betoffice development server
    # /bin/mysql -u betofficesu --password=betoffice -D betoffice -h 192.168.0.136 < "$IMPORT_FILE"
    # Docker | betofficedb
    /bin/mysql -u $2 --password=$3 -D $4 -h 192.168.99.101 < "$IMPORT_FILE"
    # /bin/mysql -u betofficesu --password=betoffice -D betoffice -h 127.0.0.1 < "$IMPORT_FILE"
}

databaseImport 'betoffice' betofficesu betoffice betoffice
databaseImport 'register' registersu register register
exit 0
