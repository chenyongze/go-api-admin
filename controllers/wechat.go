/*
* @Author:yongze.chen
* @Date:2018/6/5 17:27
 */
package controllers

type WechatController struct {
	BaseController
}

func (self *WechatController) Edit() {
	self.Data["pageTitle"] = "微信配置"
	self.display()
	self.TplName = "wechat/edit.html"
}
