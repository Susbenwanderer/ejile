package com.qtztlink.ejile.common.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.qtztlink.ejile.common.authentication.JWTUtils;
import com.qtztlink.ejile.system.model.communication.MessageContact;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author Tiger
 * @date 2019-11-25
 * @see com.qtztlink.ejile.common.websocket
 **/
@Component
@Slf4j
public class MyWebSocket extends TextWebSocketHandler {
    private static ConcurrentHashMap<String, WebSocketSession> userSession = new ConcurrentHashMap<>();

    @Resource
    private RedisTemplate redisTemplate;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        String userId = getUserId(session);
        userSession.put(userId, session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        String userId = getUserId(session);
        if (userSession.get(userId) != null) {
            userSession.remove(userId);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        MessageContact messageEntity = mapper.readValue(message.getPayload(), MessageContact.class);
        redisTemplate.convertAndSend("CHAT_CHANNEL", messageEntity);
    }

    static void redisSendToUser(MessageContact messageEntity) throws IOException {
        WebSocketSession webSocketSession = userSession.get(messageEntity.getToUser());
        if (webSocketSession != null) {
            ObjectMapper mapper = new ObjectMapper();
            TextMessage returnMessage = new TextMessage(mapper.writeValueAsString(messageEntity));
            try {
                webSocketSession.sendMessage(returnMessage);
            } catch (Exception ignored) {
            }
        }
    }

    private String getUserId(WebSocketSession session) {
        UriComponents uriComponents = UriComponentsBuilder.fromUri(session.getUri()).build();
        String token = Objects.requireNonNull(uriComponents.getQueryParams().getFirst("token")).replace("%22", "");
        return Objects.requireNonNull(JWTUtils.getUserId(token)).toString();
    }
}
