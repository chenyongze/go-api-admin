/*
* @Author:yongze.chen
* @Date:2018/6/25 22:54
 */
package libs

import (
	"errors"
	simplejson "github.com/bitly/go-simplejson"
	"github.com/dkeng/pkg/http"
)

//var (
//	// AppID 应用Key
//	AppID = "wx8e2a32f7e3e28aa2"
//	// AppSecret 秘密
//	AppSecret = "a813cff6a0d249272721ba3f56260a37"
//)

// Parameter 参数
type Parameter map[string]string

// Execute 执行
func Execute(url string, param Parameter) (json *simplejson.Json, err error) {
	err = checkConfig(param)
	if err != nil {
		return
	}
	//param["appid"] = AppID
	//param["secret"] = AppSecret

	result, err := http.Get(url, param)
	if err != nil {
		return
	}
	json, err = simplejson.NewJson([]byte(result))
	if err != nil {
		return
	}
	if errmsg, ok := json.CheckGet("errcode"); ok {
		bytes, _ := errmsg.Encode()
		err = errors.New(string(bytes))
		return
	}
	return
}


func checkConfig(param Parameter) error {
	if param["appid"] == "" {
		return errors.New("AppID 不能为空")
	}

	if param["secret"] == "" {
		return errors.New("AppSecret 不能为空")
	}
	return nil
}

