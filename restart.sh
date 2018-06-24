#! /bin/bash
###########################################
# @Info 重启 go 应用
# @Author: yongze.chen
# @Date:   2018-05-25 15:44:45
############################################

TAR_FILE=$1
APP_PATH=$2
DIST_FILE=$3

cd ${APP_PATH}
echo "解压文件${TAR_FILE}..."
tar -xzvf ${TAR_FILE}

#echo "modify app.conf include ..."
#sed -i "s/include/#include/g" conf/app.conf
#echo -e "\n include \"${DIST_FILE}\"" >> conf/app.conf

echo "del....${TAR_FILE}"
rm -rf ${TAR_FILE}

echo "重启 run.sh"
./run.sh restart

#remove conf of dev
#rm -rf conf/app.conf
#cp conf/app.conf.bat conf/app.conf
#supervisorctl restart beepkg