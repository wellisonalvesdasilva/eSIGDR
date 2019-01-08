package com.daoimpl;

import java.util.List;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.daoapi.CardapioDao;
import com.daoapi.VendaDao;
import com.entities.Cardapio;
import com.entities.Venda;

@Repository
@Transactional
public class VendaDaoImpl implements VendaDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Venda> list() {

		return session.getCurrentSession()
				.createQuery("from Venda as c "
						+ "inner join fetch c.cliente "
						+ "inner join fetch c.agendamento"	
						+ "inner join fetch c.usuario"
						+ "inner join fetch c.cardapio"	
						+ "inner join fetch c.status"
						).list();
	}


}
