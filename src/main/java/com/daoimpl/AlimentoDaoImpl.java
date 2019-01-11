package com.daoimpl;

import java.util.List;
import java.util.Map;
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
	public List<Alimento> list(Map<String, String> objPesquisa) {

		String sql = "";

		if (objPesquisa != null) {
			if (objPesquisa.get("id") != "" && objPesquisa.get("id") != null) {
				if (sql.contains("where")) {
					sql = sql + "and u.id='" + objPesquisa.get("id") + "'";
				} else {
					sql = "where u.id='" + objPesquisa.get("id") + "'";
				}
			}

			if (objPesquisa.get("titulo") != "" && objPesquisa.get("titulo") != null) {
				if (sql.contains("where")) {
					sql = sql + "and u.titulo='" + objPesquisa.get("titulo") + "'";
				} else {
					sql = "where u.titulo='" + objPesquisa.get("titulo") + "'";
				}
			}
		}
		if (sql != "") {
			return session.getCurrentSession().createQuery("from Alimento as u" + " " + sql).list();
		} else {
			return session.getCurrentSession().createQuery("from Alimento").list();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Alimento> listAlimentosPorCategoria(Integer tipoAlimento) {
		return session.getCurrentSession().createQuery("from Alimento as u where u.categoria_id =" + tipoAlimento)
				.list();
	}

	public boolean deletar(Integer id) {
		Alimento ObjLocalizado = (Alimento) session.getCurrentSession()
				.createQuery("from Alimento as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			session.getCurrentSession().delete(ObjLocalizado);
			return true;
		}
		return false;
	}

	public Alimento getObj(Integer id) {
		Alimento ObjLocalizado = (Alimento) session.getCurrentSession()
				.createQuery("from Alimento as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			return ObjLocalizado;
		}
		return null;
	}

	public void merge(Alimento alimento) {
		session.getCurrentSession().update(alimento);
	}

	public void persist(Alimento alimento) {
		session.getCurrentSession().save(alimento);
	}

}
