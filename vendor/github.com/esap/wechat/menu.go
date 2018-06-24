package wechat

import (
	"fmt"

	"github.com/esap/wechat/util"
)

// WXAPI_ENT 企业号菜单接口
const (
	WXAPI_GetMenu = `menu/get?access_token=%s&agentid=%d`
	WXAPI_AddMenu = `menu/create?access_token=%s&agentid=%d`
	WXAPI_DelMenu = `menu/delete?access_token=%s&agentid=%d`
)

type (
	// Button 按钮
	Button struct {
		Name      string `json:"name"`
		Type      string `json:"type"`
		Key       string `json:"key"`
		Url       string `json:"url"`
		AppId     string `json:"appid"`
		PagePath  string `json:"pagepath"`
		SubButton []struct {
			Name string `json:"name"`
			Type string `json:"type"`
			Key  string `json:"key"`
			Url  string `json:"url"`
			AppId     string `json:"appid"`
			PagePath  string `json:"pagepath"`
		} `json:"sub_button"`
	}
	// Menu 菜单
	Menu struct {
		WxErr
		Button []Button `json:"button"`

		Menu struct {
			Button []Button `json:"button"`
		} `json:"menu,omitempty"`
	}
)

// GetMenu 获取应用菜单
func (s *Server) GetMenu() (m *Menu, err error) {
	m = new(Menu)
	url := fmt.Sprintf(s.RootUrl+WXAPI_GetMenu, s.GetAccessToken(), s.AgentId)
	if err = util.GetJson(url, m); err != nil {
		return
	}
	if len(m.Menu.Button) == 0 && len(m.Button) > 0 {
		m.Menu.Button = m.Button
	}
	err = m.Error()
	return
}

// AddMenu 创建应用菜单
func (s *Server) AddMenu(m *Menu) (err error) {
	e := new(WxErr)
	url := fmt.Sprintf(s.RootUrl+WXAPI_AddMenu, s.GetAccessToken(), s.AgentId)
	if err = util.PostJsonPtr(url, m, e); err != nil {
		return
	}
	return e.Error()
}

// DelMenu 删除应用菜单
func (s *Server) DelMenu() (err error) {
	e := new(WxErr)
	url := fmt.Sprintf(s.RootUrl+WXAPI_DelMenu, s.GetAccessToken(), s.AgentId)
	if err = util.GetJson(url, e); err != nil {
		return
	}
	return e.Error()
}
