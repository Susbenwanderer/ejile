package com.qtztlink.ejile.system.dao.communication;

import com.qtztlink.ejile.system.model.communication.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ContactDao extends JpaRepository<Contact, Integer>, JpaSpecificationExecutor<Contact> { // 本系统不允许撤回消息

    List<Contact> findAllBySidEqualsAndCidEquals(Integer sid, Integer cid);

    List<Contact> findAllBySidEquals(Integer sid);

    List<Contact> findAllByCidEquals(Integer cid);
}
