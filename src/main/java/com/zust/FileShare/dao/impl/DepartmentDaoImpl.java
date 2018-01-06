package com.zust.FileShare.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zust.FileShare.dao.DepartmentDao;
import com.zust.FileShare.entity.Department;
import com.zust.FileShare.entity.User;

@Repository
public class DepartmentDaoImpl  extends BaseDaoImpl<Department> implements DepartmentDao {
	@Autowired
    private SessionFactory sessionFactory;
	private static final Logger log = LoggerFactory.getLogger(DepartmentDao.class);
	
	public Department findById(int id) {
		log.debug("getting Department instance with id: " + id);
		try {
			 String hql = "from Department d where d.id = ?";
	            Query query = sessionFactory.openSession().createQuery(hql);
	            query.setParameter(0,id);
	            if(query != null && query.list().size()!=0){
	                return (Department) query.list().get(0);
	            }else {
	                return null;
	            }
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	
}
