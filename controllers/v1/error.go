/*
* @Author:yongze.chen
* @Date:2018/6/23 16:44
 */
package v1

type ErrorController struct {
	BaseController
}

//Error404函数其实调用对应的就是Abort("404")
func (c *ErrorController) Error404() {
	c.Data["content"] = "page not found"
	c.ajaxMsg(c.Data["content"],-60404)
}

func (c *ErrorController) Error501() {
	c.Data["content"] = "server error"
	c.ajaxMsg(c.Data["content"],-60501)
}

func (c *ErrorController) ErrorDb() {
	c.Data["content"] = "database is now down"
	c.ajaxMsg(c.Data["content"],-60502)
}
