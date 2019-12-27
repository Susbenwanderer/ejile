package com.qtztlink.ejile.system.service.communication;

import com.qtztlink.ejile.system.model.communication.Contact;

import java.util.List;

public interface ContactService {
    Contact add(Contact contact); // 添加一条对话

    List<Contact> queryContactBySIDCID(Integer SID, Integer CID);

    List<Contact> queryContactBySID(Integer SID);

    List<Contact> queryContactByCID(Integer CID);

    void readContact(int cid, int sid, String state);
}
