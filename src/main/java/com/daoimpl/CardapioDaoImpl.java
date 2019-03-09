package com.daoimpl;

import java.util.List;
import java.util.Map;
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

	@SuppressWarnings("unchecked")
	public List<Cardapio> list(Map<String, String> objPesquisa) {
		return session.getCurrentSession().createQuery("from Cardapio").list();
	}
}
