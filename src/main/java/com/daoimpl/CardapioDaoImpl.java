package com.daoimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.daoapi.CardapioDao;
import com.entities.Cardapio;

@Repository
@Transactional
public class CardapioDaoImpl implements CardapioDao {

	@Autowired
	SessionFactory session;

	public void persist(Cardapio obj) {
		session.getCurrentSession().save(obj);
	}
}
