package com.daoimpl;

import java.util.List;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.daoapi.AgendamentoDao;
import com.entities.Agendamento;

@Repository
@Transactional
public class AgendamentoDaoImpl implements AgendamentoDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Agendamento> list(Map<String, String> objPesquisa) {

		String sql = "";

		if (objPesquisa.get("id") != "" && objPesquisa.get("id") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.id='" + objPesquisa.get("id") + "'";
			} else {
				sql = "where u.id='" + objPesquisa.get("id") + "'";
			}
		}

		if (objPesquisa.get("nome") != "" && objPesquisa.get("nome") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.nome='" + objPesquisa.get("nome") + "'";
			} else {
				sql = "where u.nome='" + objPesquisa.get("nome") + "'";
			}
		}

		if (objPesquisa.get("login") != "" && objPesquisa.get("login") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.login='" + objPesquisa.get("login") + "'";
			} else {
				sql = "where u.login='" + objPesquisa.get("login") + "'";
			}
		}

		if (objPesquisa.get("ativo") != "" && objPesquisa.get("ativo") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.ativo='" + objPesquisa.get("ativo") + "'";
			} else {
				sql = "where u.ativo='" + objPesquisa.get("ativo") + "'";
			}
		}

		if (objPesquisa.get("email") != "" && objPesquisa.get("email") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.email='" + objPesquisa.get("email") + "'";
			} else {
				sql = "where u.email='" + objPesquisa.get("email") + "'";
			}
		}

		if (sql != "") {
			return session.getCurrentSession()
					.createQuery("from Agendamento as u " + "inner join fetch u.status" + " " + sql).list();
		} else {
			return session.getCurrentSession().createQuery("from Agendamento as u " + "inner join fetch u.status")
					.list();
		}
	}

	public boolean deletar(Integer id) {
		Agendamento ObjLocalizado = (Agendamento) session.getCurrentSession()
				.createQuery("from Agendamento as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			session.getCurrentSession().delete(ObjLocalizado);
			return true;
		}
		return false;
	}

	public Agendamento getObj(Integer id) {
		Agendamento ObjLocalizado = (Agendamento) session.getCurrentSession()
				.createQuery("from Agendamento as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			return ObjLocalizado;
		}
		return null;
	}

	public void merge(Agendamento Agendamento) {
		session.getCurrentSession().update(Agendamento);
	}

	public void persist(Agendamento Agendamento) {
		session.getCurrentSession().save(Agendamento);
	}

}
