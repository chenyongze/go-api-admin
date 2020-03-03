# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.47)
# Database: go-api-admin
# Generation Time: 2020-03-03 07:51:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dt_api_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_api_detail`;

CREATE TABLE `dt_api_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '主表ID',
  `method` tinyint(1) NOT NULL DEFAULT '1' COMMENT '方法名称：1-GET 2-POST 3-PUT 4-PATCH 5-DELETE',
  `api_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '接口名称',
  `api_url` varchar(100) NOT NULL DEFAULT '0' COMMENT '接口地址',
  `detail` text COMMENT '返回结果，正确或错误',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `audit_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核人',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：0-暂停使用，1-正在开发，2-正在审核，3-正常，4-未通过',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='API附表';

LOCK TABLES `dt_api_detail` WRITE;
/*!40000 ALTER TABLE `dt_api_detail` DISABLE KEYS */;

INSERT INTO `dt_api_detail` (`id`, `source_id`, `method`, `api_name`, `api_url`, `detail`, `audit_time`, `audit_id`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,1,1,'获取单个sku库存','/v0/stock','#### 简要描述：\n\n- 用户库存接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,1,3,1,1,1507617867,1516284409),
	(2,1,3,'更新库存接口','/v0/stock/:id','#### 更新库存简要描述：\n\n- 更新库存接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,1,3,1,1,1507619939,1516284492),
	(3,2,1,'获取订单列表接口','/v0/order','#### 获取订单列表接口\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1507699351,1516286722),
	(4,3,2,'新增商品接口','/v0/product','#### 新增商品接口\n\n- 新增商品接口接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1515762214,1516286707),
	(5,4,1,'获取交易总额','/v0/trade','#### 获取交易总额\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1515763734,1516286689),
	(6,5,5,'删除评价接口','/v0/evaluate/:id','#### 删除评价接口：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1515763795,1516286674),
	(7,6,1,'获取物流详情','/v0/delivery','#### 获取物流详情\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1515763945,1516286639),
	(8,6,3,'更新物流信息','/v0/delivery','#### 更新物流信息：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1515764025,1516286625),
	(9,3,1,'获取商品列表','/product','#### 简要描述：\n\n                    - 用户登录接口\n\n                    #### 接口版本：\n\n                    |版本号|制定人|制定日期|修订日期|\n                    |:----    |:---|:----- |-----   |\n                    |2.1.0 |秦亮  |2017-03-20 |  xxxx-xx-xx |\n\n                    #### 请求URL:\n\n                    - http://xx.com/api/login\n\n                    #### 请求方式：\n\n                    - GET\n                    - POST\n\n                    #### 请求头：\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |Content-Type |是  |string |请求类型： application/json   |\n                    |Content-MD5 |是  |string | 请求内容签名    |\n\n\n                    #### 请求参数:\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |username |是  |string |用户名   |\n                    |password |是  |string | 密码    |\n\n                    #### 返回示例:\n\n                    **正确时返回:**\n\n                    ```\n                    {\n                        \"errcode\": 0,\n                        \"data\": {\n                            \"uid\": \"1\",\n                            \"account\": \"admin\",\n                            \"nickname\": \"Minho\",\n                            \"group_level\": 0 ,\n                            \"create_time\": \"1436864169\",\n                            \"last_login_time\": \"0\",\n                        }\n                    }\n                    ```\n\n                    **错误时返回:**\n\n\n                    ```\n                    {\n                        \"errcode\": 500,\n                        \"errmsg\": \"invalid appid\"\n                    }\n                    ```\n\n                    #### 返回参数说明:\n\n                    |参数名|类型|说明|\n                    |:-----  |:-----|-----                           |\n                    |group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n                    #### 备注:\n\n                    - 更多返回错误代码请看首页的错误代码描述',0,0,4,1,1,1515937531,1516286613),
	(10,3,5,'删除商品接口','/v0/product','#### 删除商品接口：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1515981318,1516286600),
	(11,4,4,'修改交易状态','/v0/delivery','#### 修改交易状态\n\n- 用户登录接口\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',0,0,3,1,1,1516003820,1516377141);

/*!40000 ALTER TABLE `dt_api_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_api_public
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_api_public`;

CREATE TABLE `dt_api_public` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_public_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '公共文档名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '99' COMMENT '排序，越小越往前',
  `detail` text NOT NULL COMMENT '详情',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`api_public_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='API参数表';

LOCK TABLES `dt_api_public` WRITE;
/*!40000 ALTER TABLE `dt_api_public` DISABLE KEYS */;

INSERT INTO `dt_api_public` (`id`, `api_public_name`, `sort`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'平台接口简介',1,'#### 平台接口简介\n\n- 这是一个测试接口平台\n\n#### 阅读对象\n - 给开发人员的看的',1,1,1,1516071841,1516282117),
	(2,'接入须知',2,'#### key 和secret获取：\n\n- 直接联系商务人员索取\n\n#### 公共参数\n|参数名|说明|\n|:-------   |:-----   |\n|time |接口调用时的时间戳，即当前时间戳（时间戳：当前距离Epoch（1970年1月1日) 以秒计算的时间，即unix-timestamp，请使用精确到秒的时间戳。|\n|app-key|上文获取的三方商家系统的唯一标示|\n|sign|输入参数的签名结果，签名方法见下节|\n\n#### 返回格式\n```\n{\n	success:true/false,\n	data:\n	error_code:\n	error_msg:\n}\n```',1,1,1,1516080573,1516283006),
	(3,'回调说明',3,'#### 加密算法\n\n- 使用用户配置的URL地址替换url路径，然后采用sign签名计算小节的方法，即可得到正确的签名结果\n\n#### 返回结果\n\n|参数名|类型|取值说明|\n|:----   |:-----  |: -----    |\n|success |Boolean |接口执行结果;为true表示执行成功; 为false表示执行失败  |\n|error_msg |String |错误信息描述|\n|error_code|String|错误码，如有具体涉及错误码请严格按照给到的错误码|\n|data|String|返回结果|',1,1,1,1516282746,1516282746);

/*!40000 ALTER TABLE `dt_api_public` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_api_source
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_api_source`;

CREATE TABLE `dt_api_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `source_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '接口名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-正常，0-删除',
  `audit_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核人时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='API主表';

LOCK TABLES `dt_api_source` WRITE;
/*!40000 ALTER TABLE `dt_api_source` DISABLE KEYS */;

INSERT INTO `dt_api_source` (`id`, `group_id`, `source_name`, `status`, `audit_id`, `create_id`, `update_id`, `create_time`, `update_time`, `audit_time`)
VALUES
	(1,2,'库存',1,0,1,1,1507616276,1516283236,0),
	(2,2,'订单',1,0,1,1,1507616329,1516283124,0),
	(3,2,'商品',1,0,1,1,1507616394,1516283140,0),
	(4,1,'交易',1,0,1,1,1507616421,1516283245,0),
	(5,1,'评价',1,0,1,1,1510122234,1516283256,0),
	(6,3,'物流',1,0,1,1,1515575836,1516286650,0),
	(7,3,'订单',0,0,1,1,1515914737,1516281455,0);

/*!40000 ALTER TABLE `dt_api_source` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_set_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_set_code`;

CREATE TABLE `dt_set_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '0' COMMENT '状态码',
  `desc` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境分组表';

LOCK TABLES `dt_set_code` WRITE;
/*!40000 ALTER TABLE `dt_set_code` DISABLE KEYS */;

INSERT INTO `dt_set_code` (`id`, `code`, `desc`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'200','返回成功','请求成功',1,0,0,1506328003,1506328037),
	(2,'300','返回错误','请求失败',1,0,0,1506328023,1506328023),
	(3,'302','请求成功','错误',0,0,0,1506328070,1506334951);

/*!40000 ALTER TABLE `dt_set_code` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_set_env
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_set_env`;

CREATE TABLE `dt_set_env` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `env_name` varchar(50) NOT NULL DEFAULT '' COMMENT '环境名称',
  `env_host` varchar(255) NOT NULL DEFAULT '0' COMMENT '环境host',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`env_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境分组表';

LOCK TABLES `dt_set_env` WRITE;
/*!40000 ALTER TABLE `dt_set_env` DISABLE KEYS */;

INSERT INTO `dt_set_env` (`id`, `env_name`, `env_host`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'测试地址','http://test.haodaquan.com','测试地址',1,0,1,1506316614,1516283029),
	(2,'测试地址3','http://127.0.0.1:8083','测试地址3',0,0,0,1506316696,1506316850),
	(3,'正式环境','http://api.haodaquan.com','这个也是测试内容',1,1,1,1515140110,1516281840);

/*!40000 ALTER TABLE `dt_set_env` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_set_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_set_group`;

CREATE TABLE `dt_set_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名',
  `detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '说明',
  `env_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '环境ID，1,2',
  `code_ids` varchar(200) NOT NULL COMMENT '状态码id 1,2',
  `api_public_ids` varchar(200) NOT NULL COMMENT '公共文档ids 1,2',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：1-正常，0-删除',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_id` (`create_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `dt_set_group` WRITE;
/*!40000 ALTER TABLE `dt_set_group` DISABLE KEYS */;

INSERT INTO `dt_set_group` (`id`, `group_name`, `detail`, `env_ids`, `code_ids`, `api_public_ids`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'供应商','这是供应商','1,3','1,2','1,2,3',1,0,1,1506237536,1516283091),
	(2,'大商户','关于大商户的接口','1,3','1,2','1,2,3',1,0,1,1506237621,1516283080),
	(3,'Top商户','有关订单的接口','1,3','1,2','1,2,3',1,1,1,1516281298,1516371024);

/*!40000 ALTER TABLE `dt_set_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_set_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_set_template`;

CREATE TABLE `dt_set_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `detail` text NOT NULL COMMENT '详情',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='API参数表';

LOCK TABLES `dt_set_template` WRITE;
/*!40000 ALTER TABLE `dt_set_template` DISABLE KEYS */;

INSERT INTO `dt_set_template` (`id`, `template_name`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'接口通用模板','#### 简要描述：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |',1,1,1,1516085341,1516281815),
	(2,'公共文档模板','#### 这是标题\n\n- 这是内容这是一个AP管理的内容模板\n内容模板啊啊',1,1,1,1516085369,1516281799);

/*!40000 ALTER TABLE `dt_set_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_uc_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_uc_admin`;

CREATE TABLE `dt_uc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

LOCK TABLES `dt_uc_admin` WRITE;
/*!40000 ALTER TABLE `dt_uc_admin` DISABLE KEYS */;

INSERT INTO `dt_uc_admin` (`id`, `login_name`, `real_name`, `password`, `role_ids`, `phone`, `email`, `salt`, `last_login`, `last_ip`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'admin','超级管理员','18f79d9555327b0a4d79b48516722066','0','13888888889','sapphire.php@gmail.com','JxV3',1583221552,'127.0.0.1',1,0,1,0,1583221394);

/*!40000 ALTER TABLE `dt_uc_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_uc_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_uc_auth`;

CREATE TABLE `dt_uc_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级',
  `auth_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '权限名称',
  `auth_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'URL地址',
  `sort` int(1) unsigned NOT NULL DEFAULT '999' COMMENT '排序，越小越前',
  `icon` varchar(255) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示，0-隐藏，1-显示',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限因子';

LOCK TABLES `dt_uc_auth` WRITE;
/*!40000 ALTER TABLE `dt_uc_auth` DISABLE KEYS */;

INSERT INTO `dt_uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`)
VALUES
	(1,0,'所有权限','/',1,'',0,1,1,1,1,1505620970,1505620970),
	(2,1,'权限管理','/',999,'fa-id-card',1,1,0,1,1,0,1505622360),
	(3,2,'管理员','/admin/list',1,'fa-user-o',1,1,1,1,1,1505621186,1505621186),
	(4,2,'角色管理','/role/list',2,'fa-user-circle-o',1,1,0,1,1,0,1505621852),
	(5,3,'新增','/admin/add',1,'',0,1,0,1,1,0,1505621685),
	(6,3,'修改','/admin/edit',2,'',0,1,0,1,1,0,1505621697),
	(7,3,'删除','/admin/ajaxdel',3,'',0,1,1,1,1,1505621756,1505621756),
	(8,4,'新增','/role/add',1,'',1,1,0,1,1,0,1505698716),
	(9,4,'修改','/role/edit',2,'',0,1,1,1,1,1505621912,1505621912),
	(10,4,'删除','/role/ajaxdel',3,'',0,1,1,1,1,1505621951,1505621951),
	(11,2,'权限因子','/auth/list',3,'fa-list',1,1,1,1,1,1505621986,1505621986),
	(12,11,'新增','/auth/add',1,'',0,1,1,1,1,1505622009,1505622009),
	(13,11,'修改','/auth/edit',2,'',0,1,1,1,1,1505622047,1505622047),
	(14,11,'删除','/auth/ajaxdel',3,'',0,1,1,1,1,1505622111,1505622111),
	(15,1,'个人中心','profile/edit',1001,'fa-user-circle-o',1,1,0,1,1,0,1506001114),
	(16,1,'API管理','/',1,'fa-cubes',1,0,0,0,1,0,1506125698),
	(17,16,'API接口','/api/list',1,'fa-link',1,1,1,1,1,1505622447,1505622447),
	(19,20,'公共文档','/apipublic/list',3,'fa-files-o',1,1,0,1,1,0,1516155852),
	(20,1,'基础设置','/',2,'fa-cogs',1,1,1,1,1,1505622601,1505622601),
	(21,20,'分组设置','/group/list',1,'fa-object-ungroup',1,1,1,1,1,1505622645,1505622645),
	(22,20,'环境设置','/env/list',2,'fa-tree',1,1,1,1,1,1505622681,1505622681),
	(23,20,'状态码设置','/code/list',3,'fa-code',1,1,1,1,1,1505622728,1505622728),
	(24,15,'资料修改','/user/edit',1,'fa-edit',1,1,0,1,1,0,1506057468),
	(25,21,'新增','/group/add',1,'n',0,1,0,1,1,0,1513324170),
	(26,21,'修改','/group/edit',2,'fa',0,0,0,0,1,1506237920,1506237920),
	(27,21,'删除','/group/ajaxdel',3,'fa',0,0,0,0,1,1506237948,1506237948),
	(28,22,'新增','/env/add',1,'fa',0,0,0,0,1,1506316506,1506316506),
	(29,22,'修改','/env/edit',2,'fa',0,0,0,0,1,1506316532,1506316532),
	(30,22,'删除','/env/ajaxdel',3,'fa',0,0,0,0,1,1506316567,1506316567),
	(31,23,'新增','/code/add',1,'fa',0,0,0,0,1,1506327812,1506327812),
	(32,23,'修改','/code/edit',2,'fa',0,0,0,0,1,1506327831,1506327831),
	(33,23,'删除','/code/ajadel',3,'fa',0,0,0,0,1,1506327857,1506327857),
	(34,17,'新增接口','/api/add',1,'fa-link',1,1,0,1,1,0,1515984869),
	(35,17,'修改接口','/api/edit',2,'fa-link',1,1,0,1,1,0,1515984880),
	(36,17,'删除接口','/api/ajaxdel',3,'fa-link',1,1,0,1,1,0,1515984893),
	(37,17,'查看接口','/api/detail',4,'',0,1,0,1,1,0,1515984908),
	(38,17,'批量审核接口','/api/ajaxchangestatus',5,'',0,1,0,1,1,0,1516000160),
	(39,16,'API资源','/apisource/list',1,'fa-skyatlas',1,1,0,1,1,0,1515984925),
	(40,39,'新增','/apisource/add',1,'',0,1,0,1,1,0,1515905034),
	(41,39,'修改','/apisource/edit',2,'',0,1,0,1,1,0,1515905044),
	(42,39,'删除','/apisource/ajaxdel',3,'',0,1,0,1,1,0,1515905055),
	(43,17,'审核页面','/api/audit',6,'',0,1,1,1,1,1516000189,1516000189),
	(44,19,'新增','/apipublic/add',1,'',0,1,1,1,1,1516067809,1516067809),
	(45,19,'修改','/apipublic/edit',2,'',0,1,1,1,1,1516067841,1516067841),
	(46,19,'删除','/apipublic/ajaxdel',3,'',0,1,1,1,1,1516067881,1516067881),
	(47,20,'模板设置','/template/list',4,'fa-file-text',1,1,1,1,1,1516083233,1516083233),
	(48,47,'新增','/template/add',1,'',0,1,1,1,1,1516083262,1516083262),
	(49,47,'修改','/template/edit',2,'',0,1,1,1,1,1516083296,1516083296),
	(50,47,'删除','/template/ajaxdel',3,'',0,1,1,1,1,1516083335,1516083335);

/*!40000 ALTER TABLE `dt_uc_auth` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_uc_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_uc_role`;

CREATE TABLE `dt_uc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '角色名称',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改这ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

LOCK TABLES `dt_uc_role` WRITE;
/*!40000 ALTER TABLE `dt_uc_role` DISABLE KEYS */;

INSERT INTO `dt_uc_role` (`id`, `role_name`, `detail`, `create_id`, `update_id`, `status`, `create_time`, `update_time`)
VALUES
	(1,'API管理员','拥有API所有权限',0,2,1,1505874156,1505874156),
	(2,'系统管理员','系统管理员',0,0,1,1506124114,1506124114);

/*!40000 ALTER TABLE `dt_uc_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dt_uc_role_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dt_uc_role_auth`;

CREATE TABLE `dt_uc_role_auth` (
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关系表';

LOCK TABLES `dt_uc_role_auth` WRITE;
/*!40000 ALTER TABLE `dt_uc_role_auth` DISABLE KEYS */;

INSERT INTO `dt_uc_role_auth` (`role_id`, `auth_id`)
VALUES
	(1,16),
	(1,17),
	(1,18),
	(1,19),
	(2,0),
	(2,1),
	(2,15),
	(2,20),
	(2,21),
	(2,22),
	(2,23),
	(2,24);

/*!40000 ALTER TABLE `dt_uc_role_auth` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
