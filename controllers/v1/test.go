/*
* @Author:yongze.chen
* @Date:2018/6/25 21:21
 */
package v1

import (
	"time"
	"fmt"
	"github.com/astaxie/beego"
)

type TestController struct {
	BaseController
}

func (self *BaseController) A()  {
	fmt.Println(time.Now().Unix())
	x := time.Now().Format("2006-01-02 15:04:05")
	beego.Info(x)
	now := time.Now()
	// ParseDuration parses a duration string.
	// A duration string is a possibly signed sequence of decimal numbers,
	// each with optional fraction and a unit suffix,
	// such as "300ms", "-1.5h" or "2h45m".
	//  Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h".
	// 10分钟前
	m, _ := time.ParseDuration("-1h")
	m1 := now.Add(m)
	fmt.Println(m1)
	//self.Ctx.WriteString(x)
	self.ajaxMsg("xxxx",-3)

}