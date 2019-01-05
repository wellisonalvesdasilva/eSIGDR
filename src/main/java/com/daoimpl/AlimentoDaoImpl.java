package com.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.daoapi.AlimentoDao;
import com.entities.Alimento;

@Repository
@Transactional
public class AlimentoDaoImpl implements AlimentoDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Alimento> list() {
		return session.getCurrentSession().createQuery("from Alimento").list();

	}

}
