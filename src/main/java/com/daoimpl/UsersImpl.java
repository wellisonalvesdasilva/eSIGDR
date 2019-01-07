package com.daoimpl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.daoapi.UsersDao;
import com.entities.Usuario;

@Repository
@Transactional
public class UsersImpl implements UsersDao {

	// private EntityManager entityManager = HibernateUtil.geEntityManager();

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Usuario> list(Map<String, String> objPesquisa) {

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
			return session.getCurrentSession().createQuery("from Users as u" + " " + sql).list();
		} else {
			return session.getCurrentSession().createQuery("from Users").list();
		}
	}

	public boolean deletar(Integer id) {
		Usuario ObjLocalizado = (Usuario) session.getCurrentSession().createQuery("from Users as u where u.id = " + id)
				.list().get(0);
		if (ObjLocalizado != null) {
			session.getCurrentSession().delete(ObjLocalizado);
			return true;
		}
		return false;
	}

	public Usuario getObj(Integer id) {
		Usuario ObjLocalizado = (Usuario) session.getCurrentSession().createQuery("from Users as u where u.id = " + id)
				.list().get(0);
		if (ObjLocalizado != null) {
			return ObjLocalizado;
		}
		return null;
	}

	public void merge(Usuario users) {
		session.getCurrentSession().update(users);
	}

	public void persist(Usuario users) {
		session.getCurrentSession().save(users);
	}

}
