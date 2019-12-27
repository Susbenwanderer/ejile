package com.qtztlink.ejile.common.controller;

import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArraySet;

@Component
//@ServerEndpoint(value = "/myWebSocket")
public class WebSocket {
    private static CopyOnWriteArraySet<WebSocket> user = new CopyOnWriteArraySet<>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        //群发消息
        for (WebSocket myWebSocket : user) {
            myWebSocket.session.getBasicRemote().sendText(message);
        }
    }

    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session.getId() + " open...");
        this.session = session;
        user.add(this);
    }

    @OnClose
    public void onClose() {
        System.out.println(this.session.getId() + " close...");
        user.remove(this);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println(this.session.getId() + " error...");
        error.printStackTrace();
    }
}
