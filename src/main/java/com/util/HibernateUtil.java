/*package com.util;

import javax.persistence.Persistence;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class HibernateUtil {
	public static EntityManagerFactory factory = null;

	static {
		init();
	}

	private static void init() {

		try {
			if (factory == null) {
				factory = Persistence.createEntityManagerFactory("entityManagerFactory");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static EntityManager geEntityManager() {
		{
			return factory.createEntityManager();
		}
	}

	public static Object getPrimaryKey(Object entity) {
		return factory.getPersistenceUnitUtil().getIdentifier(entity);

	}
}*/