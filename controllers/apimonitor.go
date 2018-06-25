/**********************************************
** @Des: This file ...
** @Author: yongze.chen
** @Date:   2017-09-08 17:48:30
** @Last Modified by:   yongze.chen
** @Last Modified time: 2017-09-09 18:50:41
***********************************************/
package controllers

type ApiMonitorController struct {
	BaseController
}

func (self *ApiMonitorController) List() {
	self.Data["pageTitle"] = "API文档"
	self.display()
}
