#!/bin/bash
TARGET_DIR_NAME=$1
git clone git://github.com/cloudfoundry/uaa.git ${TARGET_DIR_NAME}/uaa && \
cd ${TARGET_DIR_NAME}/uaa && git checkout tags/3.2.1 && \
cp /root/uaaconfig/uaa.yml ${TARGET_DIR_NAME}/uaa/uaa/src/main/resources/ && \
./gradlew :cloudfoundry-identity-uaa:war
