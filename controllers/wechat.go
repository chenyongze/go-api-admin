/*
* @Author:yongze.chen
* @Date:2018/6/5 17:27
 */
package controllers

import (
	"github.com/esap/wechat"
	"github.com/astaxie/beego"
)

type WechatController struct {
	BaseController
}

func (self *WechatController) Edit() {
	self.Data["pageTitle"] = "微信配置"
	self.display()
	self.TplName = "wechat/edit.html"
}

func (self *WechatController) SendMsg() {

	self.Ctx.WriteString("ok")
}

func  (self *WechatController) sendWechat(){
	wechat.Debug = true
	err :=wechat.Set("yourToken", "yourAppID", "yourSecret", "yourAesKey")
	beego.Info(err)
	//w http.ResponseWriter, r *http.Request
	//w :=http.ResponseWriter
	//r := *http.Request
	//wechat.VerifyURL().NewText("这是客服消息").Send().NewText("这是被动回复").Reply()
}
