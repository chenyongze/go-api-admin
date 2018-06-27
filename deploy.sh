#!/bin/bash
##########################################
# @Info 发布脚本
# @Author: yongze.chen
# @Date:   2018-05-25 15:44:45
###########################################

APP_NAME=go-api-admin
APP_PATH_SOURCE=/home/wwwroot/yongze-source/
PACK_EXS='.go:.DS_Store:.tmp:info.log:deploy.sh:Dockerfile:vendor:restart.sh:swagger:README.md:.gitee:db:README-zh.md:conf/app.conf.example:docs'

case $1 in
	prod)
		echo "线上服务器..."
		TAR_FILE="${APP_NAME}-$1.tar.gz"
		APP_PATH=${APP_PATH_SOURCE}${APP_NAME}/
		DIST_FILE=prod.conf
		IP=115.28.18.28
		USER=root
	;;
	dev)
		echo "测试服务器..."
		TAR_FILE="${APP_NAME}-$1.tar.gz"
		APP_PATH=${APP_PATH_SOURCE}${APP_NAME}/
		DIST_FILE=dev.conf
		IP=114.215.25.201
		USER=root
	;;
	*)
		echo "Usage: $0 {prod|dev}"
		exit 4
	;;
esac
#todo
echo "开始打包${TAR_FILE}..."
export GOARCH=amd64
export GOOS=linux
sed -i "" 's#runmode=dev#runmode=prod#g' ${PWD}/conf/app.conf
cat ${PWD}/conf/app.conf
bee pack -exs=${PACK_EXS}
echo "改变回配置"
sed -i "" 's#runmode=prod#runmode=dev#g' ${PWD}/conf/app.conf

echo "scp ===>"
mv ${APP_NAME}.tar.gz ${TAR_FILE}
scp ${TAR_FILE} ${USER}@${IP}:${APP_PATH}

echo "restart"
ssh ${USER}@${IP} 'bash -s' < restart.sh ${TAR_FILE} ${APP_PATH} ${DIST_FILE}

echo "rm ${TAR_FILE}..."
rm -rf ${TAR_FILE}

