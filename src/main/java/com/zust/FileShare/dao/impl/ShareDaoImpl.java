package com.zust.FileShare.dao.impl;

import java.io.Serializable;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zust.FileShare.dao.ShareDao;
import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.Share;
@Repository
public class ShareDaoImpl  extends BaseDaoImpl<Share> implements ShareDao {

	@Autowired
    private SessionFactory sessionFactory;
    private static final Logger log = LoggerFactory.getLogger(ShareDao.class);
	
	
	@Override
	public List<Share> findByUser(String sql, int page, int rows) {
		// TODO Auto-generated method stub
		SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
		q.addEntity("s", Share.class);
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}
	
	
	 public Share findById(int id){
	        log.debug("finding fans instances");
	        try {
	            String hql = "from Share s where s.id = ?";
	            Query query = sessionFactory.getCurrentSession().createQuery(hql);
	            query.setParameter(0,id);
	            if(query != null && query.list().size()!=0){
	                return (Share) query.list().get(0);
	            }else {
	                return null;
	            }
	        } catch (RuntimeException re) {
	            log.error("find all failed", re);
	            throw re;
	        }
	    }

	

}
