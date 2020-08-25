#!/bin/bash

java -jar ${HEAP_XMS:-"-Xms256m"} ${HEAP_XMX:-"-Xmx256m"} \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:HeapDumpPath=${LOG_PATH:-/webapp/logs} \
    -Dfile.encoding=${FILE_ENCODING:-UTF-8} \
    -Dserver.tomcat.max-threads=${MAX_THREAD:-200}  \
    -Dserver.tomcat.min-spare-threads=${MIN_SPARE_THREAD:-20} \
    -Dserver.tomcat.accesslog.directory=${LOG_PATH:-/webapp/logs} \
	  -Dspring.profiles.active=${PROFILE:-prod} \
	  -Dlogdir=${LOG_PATH:-/webapp/logs} \
	  -Dfile.upload.path=${FILE_UPLOAD_PATH:-/webapp/file} \
	/webapp/simple-file.jar