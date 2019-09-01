package main
import (
	"fmt"
	"golang.org/x/net/websocket"
	"html/template"  //支持模板html
	"log"
	"net/http"
)

func Echo(ws *websocket.Conn){
	var err error
	for {
		var reply string
		// websocket 接受信息
		if err = websocket.Message.Receive(ws, &reply); err != nil {
			fmt.Println("receive failed: ", err)
			break;
		}
        fmt.Println("received from client： " + reply)
        msg := "received:" + reply
        fmt.Println("send to client:" + msg)
        
        //这里是发送消息
        if err = websocket.Message.Send(ws,msg);err != nil {
            fmt.Println("Send failed:" ,err);
            break;
        }

	}
}

func web(w http.ResponseWriter,r *http.Request){
    //打印请求的方法
    fmt.Println("method",r.Method)
    if r.Method == "GET"{
    //如果请求为get显示login.html,并相应给前端
        t, _ := template.ParseFiles("websocket.html");
        t.Execute(w, nil)
    } else {
        /// 否则打印输出post接受的参数username 和 password
        fmt.Println(r.PostFormValue("username"))
        fmt.Println(r.PostFormValue("password"))
    }
}


func main() {
    //接受websocket的路由地址
    http.Handle("/websocket", websocket.Handler(Echo))
    //html页面
    http.HandleFunc("/web", web)
    fmt.Println("正在初始化监听1234")
    if err := http.ListenAndServe(":1234",nil);err != nil {
        log.Fatal("ListenAndServe: ", err)
        fmt.Println(err)
        fmt.Println("err")
    }
    fmt.Println("正在监听1234")
}
