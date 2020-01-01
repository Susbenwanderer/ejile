package com.qtztlink.ejile.common.handler;

import com.qtztlink.ejile.common.authentication.JWTUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;

/**
 * @author Tiger
 * @date 2019-11-25
 * @see com.qtztlink.ejile.common.handler
 **/
public class WebSocketHandshakeInterceptor implements HandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object
            > attributes) {
        UriComponents uriComponents = UriComponentsBuilder.fromUri(request.getURI()).build();
        String token = Objects.requireNonNull(uriComponents.getQueryParams().getFirst("token")).replace("%22", "");
        return JWTUtils.getUserId(token) != null;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {

    }
}
