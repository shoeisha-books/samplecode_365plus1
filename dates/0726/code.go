package main

import (
    "fmt"
    "golang.org/x/net/websocket"
    "golang.org/x/term"
    "os"
    "strings"
    "time"
)

func main() {
    width, _, _ := term.GetSize(int(os.Stdout.Fd()))
    ws, _ := websocket.Dial("wss://relay.damus.io", "", "http://localhost/")
    defer ws.Close()
    websocket.Message.Send(ws, `["REQ","sub1",{"kinds":[1]}]`)
    for {
        var msg []interface{}
        websocket.JSON.Receive(ws, &msg)
        if len(msg) >= 3 && msg[0] == "EVENT" && msg[1] == "sub1" {
            event := msg[2].(map[string]interface{})
            fmt.Printf("%s\n[%s user:%s]\n\n%s\n\n",
                strings.Repeat("-", width),
                time.Unix(int64(event["created_at"].(float64)), 0).Add(9*time.Hour),
                event["pubkey"].(string)[:8]+"...",
                event["content"].(string))
        }
    }
}