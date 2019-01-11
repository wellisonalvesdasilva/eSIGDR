package com.daoimpl;

import java.util.List;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.daoapi.ClienteDao;
import com.entities.Cliente;

@Repository
@Transactional
public class ClienteDaoImpl implements ClienteDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Cliente> list(Map<String, String> objPesquisa) {

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

		if (objPesquisa.get("email") != "" && objPesquisa.get("email") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.email='" + objPesquisa.get("email") + "'";
			} else {
				sql = "where u.email='" + objPesquisa.get("email") + "'";
			}
		}

		if (objPesquisa.get("cpf") != "" && objPesquisa.get("cpf") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.cpf='" + objPesquisa.get("cpf") + "'";
			} else {
				sql = "where u.cpf='" + objPesquisa.get("cpf") + "'";
			}
		}

		if (objPesquisa.get("telefone") != "" && objPesquisa.get("telefone") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.telefone='" + objPesquisa.get("telefone") + "'";
			} else {
				sql = "where u.telefone='" + objPesquisa.get("telefone") + "'";
			}
		}

		if (objPesquisa.get("telefoneRecado") != "" && objPesquisa.get("telefoneRecado") != null) {
			if (sql.contains("where")) {
				sql = sql + "and u.telefoneRecado='" + objPesquisa.get("telefoneRecado") + "'";
			} else {
				sql = "where u.telefoneRecado='" + objPesquisa.get("telefoneRecado") + "'";
			}
		}

		if (sql != "") {
			return session.getCurrentSession().createQuery("from Cliente as u" + " " + sql).list();
		} else {
			return session.getCurrentSession().createQuery("from Cliente").list();
		}
	}

	public boolean deletar(Integer id) {
		Cliente ObjLocalizado = (Cliente) session.getCurrentSession()
				.createQuery("from Cliente as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			session.getCurrentSession().delete(ObjLocalizado);
			return true;
		}
		return false;
	}

	public Cliente getObj(Integer id) {
		Cliente ObjLocalizado = (Cliente) session.getCurrentSession()
				.createQuery("from Cliente as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			return ObjLocalizado;
		}
		return null;
	}

	public void merge(Cliente users) {
		session.getCurrentSession().update(users);
	}

	public void persist(Cliente users) {
		session.getCurrentSession().save(users);
	}

}
