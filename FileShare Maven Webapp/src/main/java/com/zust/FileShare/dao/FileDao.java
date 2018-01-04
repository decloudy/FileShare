package com.zust.FileShare.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zust.FileShare.entity.File;

/**
 * A data access object (DAO) providing persistence and search support for File
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see entity.File
 * @author MyEclipse Persistence Tools
 */
public class FileDao extends BaseHibernateDao {
	private static final Logger log = LoggerFactory.getLogger(FileDao.class);
	// property constants
	public static final String FILE_NAME = "fileName";
	public static final String FILE_FORMAT = "fileFormat";
	public static final String SIZE = "size";
	public static final String DWL_NUM = "dwlNum";

	public void save(File transientInstance) {
		log.debug("saving File instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(File persistentInstance) {
		log.debug("deleting File instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public File findById(java.lang.Integer id) {
		log.debug("getting File instance with id: " + id);
		try {
			File instance = (File) getSession().get("entity.File", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<File> findByExample(File instance) {
		log.debug("finding File instance by example");
		try {
			List<File> results = (List<File>) getSession().createCriteria("entity.File").add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding File instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from File as model where model." + propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<File> findByFileName(Object fileName) {
		return findByProperty(FILE_NAME, fileName);
	}

	public List<File> findByFileFormat(Object fileFormat) {
		return findByProperty(FILE_FORMAT, fileFormat);
	}

	public List<File> findBySize(Object size) {
		return findByProperty(SIZE, size);
	}

	public List<File> findByDwlNum(Object dwlNum) {
		return findByProperty(DWL_NUM, dwlNum);
	}

	public List findAll() {
		log.debug("finding all File instances");
		try {
			String queryString = "from File";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public File merge(File detachedInstance) {
		log.debug("merging File instance");
		try {
			File result = (File) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(File instance) {
		log.debug("attaching dirty File instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(File instance) {
		log.debug("attaching clean File instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}