CHANGE MASTER TO MASTER_HOST='db-master',MASTER_USER='repl', MASTER_PASSWORD='replica123456', MASTER_SSL=1,MASTER_LOG_FILE='binlog.000002',MASTER_LOG_POS=525;

CHANGE MASTER TO MASTER_HOST='gtid1',MASTER_USER='root',MASTER_PASSWORD='xiefei',MASTER_SSL=1,MASTER_AUTO_POSITION=1;