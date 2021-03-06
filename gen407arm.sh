#!/bin/bash

PROJ_BUILD=buildarm
SERVICE=img
IMG_BUILD=${PROJ_BUILD}_${SERVICE}
IMG_CONTAINER=${PROJ_BUILD}_${SERVICE}_1

IMG_NAME=tv407_arm
IMG_TAR=${IMG_NAME}.tar

#install libiconv and tvheadend
cd ${PROJ_BUILD}
docker-compose up

cd ..
docker export ${IMG_CONTAINER} >${IMG_TAR}

#remove instances
docker rm ${IMG_CONTAINER} ${PROJ_BUILD}_src_1
docker rmi ${IMG_BUILD}
docker import - ${IMG_NAME}_raw <${IMG_TAR}
rm ${IMG_TAR}
docker build --no-cache=true -t ${IMG_NAME} arm
docker rmi ${IMG_NAME}_raw
