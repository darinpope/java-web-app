#!/bin/sh

set -e
java -version
NOW=$(date +"%Y-%m-%d %H:%M:%S %Z")
NETTY_TMP=-Dio.netty.native.workdir=/tmp
SECURITY_OPT=-Djava.security.egd=file:/dev/./urandom
echo
echo "TZ            <$TZ>"
echo "NOW           <$NOW>"
echo "NETTY_TMP     <$NETTY_TMP>"
echo "SECURITY_OPT  <$SECURITY_OPT>"
echo "JAVA_OPTS     <$JAVA_OPTS>"

java $SECURITY_OPT $NETTY_TMP $JAVA_OPTS -jar /workspace/app.jar