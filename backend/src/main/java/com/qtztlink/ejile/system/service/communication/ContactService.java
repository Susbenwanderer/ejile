package com.qtztlink.ejile.system.service.communication;

import com.qtztlink.ejile.system.model.communication.Contact;

import java.util.List;
import java.util.Map;

public interface ContactService {
    Contact add(Contact contact); // 添加一条对话

    List<Contact> queryContactBySIDCID(Integer SID, Integer CID);

    List<Contact> queryContactBySID(Integer SID);

    List<Contact> queryContactByCID(Integer CID);

    List<Map<String, Object>> queryAllContact();

    void readContact(int cid, int sid, String state);
}
