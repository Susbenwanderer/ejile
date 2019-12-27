package com.qtztlink.ejile.system.model.communication;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

/**
 * @author Tiger
 * @date 2019-10-29
 * @see com.qtztlink.ejile.system.model.communication
 **/
@Data
public class MessageContact implements Serializable {
    int cid;
    int sid;
    String ctime;
    String state;
    String content;
    String isRead;
}
