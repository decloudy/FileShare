package com.zust.FileShare.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;



/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDao implements IBaseHibernateDao {
	
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
}