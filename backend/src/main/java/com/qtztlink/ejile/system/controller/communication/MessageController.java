package com.qtztlink.ejile.system.controller.communication;

import com.qtztlink.ejile.common.bean.ResponseBean;
import com.qtztlink.ejile.system.model.communication.MessageContact;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author Tiger
 * @date 2019-11-27
 * @see com.qtztlink.ejile.system.controller.communication
 **/
@RestController
public class MessageController {
    @Resource
    RedisTemplate redisTemplate;

    @GetMapping("/message")
    public ResponseBean getContactList(int userId) {
        return new ResponseBean().code(200).message("SUCCESS");
    }

    @PostMapping("/message")
    public ResponseBean sendMessage(MessageContact messageContact) {
        redisTemplate.convertAndSend("CHAT_CHANNEL", messageContact);
        return new ResponseBean().code(200).message("SUCCESS");
    }
}
