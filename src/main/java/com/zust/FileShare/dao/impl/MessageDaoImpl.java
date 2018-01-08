package com.zust.FileShare.dao.impl;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zust.FileShare.dao.MessageDao;
import com.zust.FileShare.dao.ShareDao;
import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.entity.Message;
import com.zust.FileShare.entity.Share;
import com.zust.FileShare.entity.User;

@Repository
public class MessageDaoImpl extends BaseDaoImpl<Message> implements MessageDao  {

	@Autowired
    private SessionFactory sessionFactory;
    private static final Logger log = LoggerFactory.getLogger(MessageDao.class);
	
	
	@Override
	public List<Message> findByUser(String sql, int page, int rows) {
		// TODO Auto-generated method stub
		SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
		q.addEntity("m", Message.class);
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

}
