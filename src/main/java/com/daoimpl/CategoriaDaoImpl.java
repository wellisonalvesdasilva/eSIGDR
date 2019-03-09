package com.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.daoapi.CategoriaDao;
import com.entities.Categoria;
import com.entities.Usuario;

@Repository
@Transactional
public class CategoriaDaoImpl implements CategoriaDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Categoria> list() {
		return session.getCurrentSession().createQuery("from Categoria").list();

	}

	public Categoria getObj(Integer id) {
		Categoria ObjLocalizado = (Categoria) session.getCurrentSession()
				.createQuery("from Categoria as c where c.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			return ObjLocalizado;
		}
		return null;
	}

}
