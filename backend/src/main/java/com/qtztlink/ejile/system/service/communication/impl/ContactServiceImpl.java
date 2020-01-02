package com.qtztlink.ejile.system.service.communication.impl;

import com.qtztlink.ejile.system.dao.communication.ContactDao;
import com.qtztlink.ejile.system.dao.communication.impl.ContactDaoImpl;
import com.qtztlink.ejile.system.model.communication.Contact;
import com.qtztlink.ejile.system.service.communication.ContactService;
import com.qtztlink.ejile.system.service.user.ConsumerService;
import com.qtztlink.ejile.system.service.user.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("contactService")
public class ContactServiceImpl implements ContactService {

    @Resource
    private ContactDao contactDao;
    @Resource
    private ConsumerService consumerService;
    @Resource
    private ShopService shopService;
    @Autowired
    private ContactDaoImpl contactDaoImpl;

    @Override
    public Contact add(Contact contact) {
        contact.setCname(consumerService.queryConsumerById(contact.getCid()).getUsername());
        contact.setSname(shopService.queryShopById(contact.getSid()).getUsername());
        contact.setIsRead("0");
        return contactDao.save(contact);
    }

    @Override
    public List<Map<String, Object>> queryAllContact() {
        return this.contactDaoImpl.queryAllContact();
    }


    @Override
    public List<Contact> queryContactBySIDCID(Integer SID, Integer CID) {
        return contactDao.findAllBySidEqualsAndCidEquals(SID, CID);
    }

    @Override
    public List<Contact> queryContactBySID(Integer SID) {
        return contactDao.findAllBySidEquals(SID);
    }

    @Override
    public List<Contact> queryContactByCID(Integer CID) {
        return contactDao.findAllByCidEquals(CID);
    }

    @Override
    public void readContact(int cid, int sid, String state) {
        Specification<Contact> specification=new Specification<Contact>() {
            @Override
            public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder cb) {
                List<Predicate> list = new ArrayList<>();
                list.add(cb.equal(root.get("sid"),sid));
                list.add(cb.equal(root.get("cid"),cid));
                list.add(cb.equal(root.get("state"),state));
                list.add(cb.equal(root.get("isRead"),"0"));
                Predicate[] p = new Predicate[list.size()];
                return cb.and(list.toArray(p));
            }
        };
        List<Contact> contacts=contactDao.findAll(specification);
        ListIterator<Contact> iterator = contacts.listIterator();
        while(iterator.hasNext()){
            Contact contact=iterator.next();
            contact.setIsRead("1");
            iterator.set(contact);
        }
        contactDao.saveAll(contacts);
    }
}
