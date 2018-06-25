package v1

import (
	"fmt"

	"github.com/silenceper/wechat"
	"github.com/silenceper/wechat/message"
	"github.com/astaxie/beego"
	"github.com/chenyongze/go-api-admin/libs"
)


type WeChatController struct {
	BaseController
}

func (self *WeChatController) Run() {
	//var rconfig *cache.RedisOpts
	//rconfig.Database,_ =  beego.AppConfig.Int("cache.redis.db")
	//rconfig.Host = beego.AppConfig.String("cache.redis.link")
	//rconfig.Password =  beego.AppConfig.String("cache.redis.auth")
	//cache := cache.NewRedis(rconfig)
	//配置微信参数
	config := &wechat.Config{
		AppID:          beego.AppConfig.String("wechat.AppID"),
		AppSecret:      beego.AppConfig.String("wechat.AppSecret"),
		Token:          beego.AppConfig.String("wechat.Token"),
		EncodingAESKey: beego.AppConfig.String("wechat.EncodingAESKey"),
		//Cache: cache,
	}
	wc := wechat.NewWechat(config)

	// 传入request和responseWriter
	server := wc.GetServer(self.Ctx.Request, self.Ctx.ResponseWriter)
	beego.Debug(self.Ctx.Request)
	//设置接收消息的处理方法
	server.SetMessageHandler(func(msg message.MixMessage) *message.Reply {
		//回复消息：演示回复用户发送的消息
		beego.Warn(msg)
		switch msg.MsgType {
		 //文本消息
		 case message.MsgTypeText:
			//do something
			//text := message.NewText("维护中....<a href='http://www.baidu.com'>点击</a>")
			//return &message.Reply{MsgType: message.MsgTypeText, MsgData: text}

			//articles := make([]*message.Article, 1)
			//article := new(message.Article)
			//article.Title = "标题"
			//article.Description = "描述信息信息信息"
			//article.PicURL = "http://ww1.sinaimg.cn/large/65209136gw1f7vhjw95eqj20wt0zk40z.jpg"
			//article.URL = "https://github.com/silenceper/wechat"
			//articles[0] = article
			//news := message.NewNews(articles)
			//return &message.Reply{message.MsgTypeNews,news}
			//图片消息
		case message.MsgTypeImage:
			//do something
			//text := message.NewText("维护中....<a href='http://www.baidu.com'>点击</a>")
			//return &message.Reply{MsgType: message.MsgTypeText, MsgData: text}
			//mediaID 可通过素材管理-上上传多媒体文件获得
			//image :=message.NewVideo("mediaID")
			//return &message.Reply{message.MsgTypeVideo, image}
			//语音消息
		case message.MsgTypeVoice:
			//video := message.NewVideo("6559902567080394752", "视频标题", "视频描述")
			//return &message.Reply{message.MsgTypeVideo, video}
			//do something
			//视频消息
		case message.MsgTypeVideo:
			//do something

			//小视频消息
		case message.MsgTypeShortVideo:
			//do something

			//地理位置消息
		case message.MsgTypeLocation:
			//do something

			//链接消息
		case message.MsgTypeLink:
			//do something

			//事件推送消息
		case message.MsgTypeEvent:

			//text := message.NewText(message.MsgTypeEvent)
			//return &message.Reply{MsgType: message.MsgTypeText, MsgData: text}

			switch msg.Event {
			//EventSubscribe 订阅
			case message.EventSubscribe:
				//do something

				//取消订阅
			case message.EventUnsubscribe:
				//do something

				//用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者
			case message.EventScan:
				//do something

				// 上报地理位置事件
			case message.EventLocation:
				//do something

				// 点击菜单拉取消息时的事件推送
			case message.EventClick:
				//do something

				// 点击菜单跳转链接时的事件推送
			case message.EventView:
				//do something

				// 扫码推事件的事件推送
			case message.EventScancodePush:
				//do something

				// 扫码推事件且弹出“消息接收中”提示框的事件推送
			case message.EventScancodeWaitmsg:
				//do something

				// 弹出系统拍照发图的事件推送
			case message.EventPicSysphoto:
				//do something

				// 弹出拍照或者相册发图的事件推送
			case message.EventPicPhotoOrAlbum:
				//do something

				// 弹出微信相册发图器的事件推送
			case message.EventPicWeixin:
				//do something

				// 弹出地理位置选择器的事件推送
			case message.EventLocationSelect:
				//do something

			}
		}
		text := message.NewText("")
		return &message.Reply{message.MsgTypeText,text}
	})

	//处理消息接收以及回复
	err := server.Serve()
	if err != nil {
		fmt.Println(err)
		self.ajaxMsg(err.Error(),MSG_ERR)
		return
	}
	fmt.Println("x")
	//发送回复的消息
	server.Send()

}

//Oauth
func (self *WeChatController) Join()  {
	url := "https://api.weixin.qq.com/sns/jscode2session"
	param := libs.Parameter{
		"js_code":    "登录时获取的 code",
		"grant_type": "authorization_code",
		"appid": beego.AppConfig.String("wechat.mini.AppId"),
		"secret": beego.AppConfig.String("wechat.mini.AppSecret"),
	}
	json, err := libs.Execute(url, param)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(json)

	self.Ctx.WriteString("ok")

}
