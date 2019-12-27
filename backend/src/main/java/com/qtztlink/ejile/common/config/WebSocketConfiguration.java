package com.qtztlink.ejile.common.config;

import com.qtztlink.ejile.common.handler.WebSocketHandshakeInterceptor;
import com.qtztlink.ejile.common.websocket.MyWebSocket;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import javax.annotation.Resource;

/**
 * @author Tiger
 * @date 2019-11-25
 * @see com.qtztlink.ejile.common.config
 **/
@Configuration
@EnableWebSocket
public class WebSocketConfiguration implements WebSocketConfigurer {
    @Resource
    MyWebSocket myWebSocket;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
        webSocketHandlerRegistry.addHandler(myWebSocket, "/myWebSocket").setAllowedOrigins("*")
                .addInterceptors(new HttpSessionHandshakeInterceptor())
                .addInterceptors(new WebSocketHandshakeInterceptor());
    }
}
