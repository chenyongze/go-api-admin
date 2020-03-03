/*
* v1  router
* @Author:yongze.chen
* @Date:2018/6/25 22:07
 */
package routers

import (
	"github.com/astaxie/beego"
	"go-api-admin/controllers/v1"
)

func init() {

	beego.Info("router v1 =====>")
	// 测试
	beego.AutoRouter(&v1.TestController{})
	beego.AutoRouter(&v1.WeChatController{})

}
