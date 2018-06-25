package main

import (
	"github.com/chenyongze/go-api-admin/models"
	_ "github.com/chenyongze/go-api-admin/routers"
	"github.com/astaxie/beego"
	"github.com/chenyongze/go-api-admin/controllers/v1"
)

func main() {
	beego.ErrorController(&v1.ErrorController{})
	models.Init()
	beego.Run()
}
