package com.zust.FileShare.dao.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zust.FileShare.dao.FileDao;
import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.User;

@Repository
public class FileDaoImpl extends BaseDaoImpl<File> implements FileDao {
	@Autowired
    private SessionFactory sessionFactory;
    private static final Logger log = LoggerFactory.getLogger(FileDao.class);
	
    public File findById(int id){
        log.debug("finding fans instances");
        try {
            String hql = "from File f where f.id = ?";
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            query.setParameter(0,id);
            if(query != null && query.list().size()!=0){
                return (File) query.list().get(0);
            }else {
                return null;
            }
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }
}
