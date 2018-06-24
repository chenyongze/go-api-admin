package main

import (
	"github.com/chenyongze/go-api-admin/models"
	_ "github.com/chenyongze/go-api-admin/routers"
	"github.com/astaxie/beego"
)

func main() {
	models.Init()
	beego.Run()
}
