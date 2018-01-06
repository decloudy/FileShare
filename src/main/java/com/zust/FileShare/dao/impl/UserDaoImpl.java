package com.zust.FileShare.dao.impl;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.entity.User;


@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Autowired
    private SessionFactory sessionFactory;
    private static final Logger log = LoggerFactory.getLogger(UserDao.class);
	
    public User findById(int id){
        log.debug("finding fans instances");
        try {
            String hql = "from User u where u.id = ?";
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            query.setParameter(0,id);
            if(query != null && query.list().size()!=0){
                return (User) query.list().get(0);
            }else {
                return null;
            }
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }
    
    
    public User findByAccount(String Account) {
		try {
			String queryString = "from User u where u.userAccount=?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString).setParameter(0, Account);
			if (queryObject != null && queryObject.list().size() != 0) {
				return (User) queryObject.list().get(0);
			} else {
				return null;
			}
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
    
    
    public List<User> findAll(){
        try {
            String hql = "from User";
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

}
