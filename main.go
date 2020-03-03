package main

import (
	"go-api-admin/models"
	_ "go-api-admin/routers"
	"github.com/astaxie/beego"
	"go-api-admin/controllers/v1"
)

func main() {
	beego.ErrorController(&v1.ErrorController{})
	models.Init()
	beego.Run()
}
