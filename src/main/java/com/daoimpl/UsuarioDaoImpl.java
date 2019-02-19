package com.daoimpl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.daoapi.UsuarioDao;
import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPaginado;
import com.entities.Usuario;

@Repository
@Transactional
public class UsuarioDaoImpl implements UsuarioDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings({ "unchecked", "null" })
	public DtoRetornoPaginado<Usuario> list(Integer pagina) {

		// Quantidade á ser pulada
		Integer offset = 10;

		@SuppressWarnings("rawtypes")
		DtoRetornoPaginado inst = new DtoRetornoPaginado();

		// Quantidade Total de Registros
		Integer quantidade = session.getCurrentSession().createQuery("from Usuario as u").list().size();
		inst.setQtdTotalDeRegistros(quantidade);

		// Quantidade de Registros Encontrados na Página
		inst.setQtdRegistroPagina(session.getCurrentSession().createQuery("from Usuario").setMaxResults(offset)
				.setFirstResult(pagina * offset).list().size());
		
		// Obter Lista para Retorno
		inst.setLista(session.getCurrentSession().createQuery("from Usuario").setMaxResults(offset)
				.setFirstResult(pagina * offset).list());

		if (quantidade > 0) {
			Double quantidadeFormatada = quantidade.doubleValue() / offset;
			inst.setNumeroPaginas((int) Math.ceil(quantidadeFormatada));
		}

		return inst;
	}

	/*
	 * if (objPesquisa.get("id") != "" && objPesquisa.get("id") != null) { if
	 * (sql.contains("where")) { sql = sql + "and u.id='" +
	 * objPesquisa.get("id") + "'"; } else { sql = "where u.id='" +
	 * objPesquisa.get("id") + "'"; } }
	 * 
	 * if (objPesquisa.get("nome") != "" && objPesquisa.get("nome") != null) {
	 * if (sql.contains("where")) { sql = sql + "and u.nome='" +
	 * objPesquisa.get("nome") + "'"; } else { sql = "where u.nome='" +
	 * objPesquisa.get("nome") + "'"; } }
	 * 
	 * if (objPesquisa.get("login") != "" && objPesquisa.get("login") != null) {
	 * if (sql.contains("where")) { sql = sql + "and u.login='" +
	 * objPesquisa.get("login") + "'"; } else { sql = "where u.login='" +
	 * objPesquisa.get("login") + "'"; } }
	 * 
	 * if (objPesquisa.get("ativo") != "" && objPesquisa.get("ativo") != null) {
	 * if (sql.contains("where")) { sql = sql + "and u.ativo='" +
	 * objPesquisa.get("ativo") + "'"; } else { sql = "where u.ativo='" +
	 * objPesquisa.get("ativo") + "'"; } }
	 * 
	 * if (objPesquisa.get("email") != "" && objPesquisa.get("email") != null) {
	 * if (sql.contains("where")) { sql = sql + "and u.email='" +
	 * objPesquisa.get("email") + "'"; } else { sql = "where u.email='" +
	 * objPesquisa.get("email") + "'"; } }
	 */

	/*
	 * else { return session.getCurrentSession().createQuery("from Usuario").
	 * list(); }
	 */

	public boolean deletar(Integer id) {
		Usuario ObjLocalizado = (Usuario) session.getCurrentSession()
				.createQuery("from Usuario as u where u.id = " + id).list().get(0);
		if (ObjLocalizado != null) {
			session.getCurrentSession().delete(ObjLocalizado);
			return true;
		}
		return false;
	}

	public Usuario getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException {

		Usuario ObjLocalizado = null;

		try {
			if (login != null && senha != null) {

				String s = senha;
				MessageDigest m = MessageDigest.getInstance("MD5");
				m.update(s.getBytes(), 0, s.length());
				String sMd5 = new BigInteger(1, m.digest()).toString(16);

				m.update(senha.toString().getBytes(), 0, senha.toString().length());
				ObjLocalizado = (Usuario) session.getCurrentSession()
						.createQuery("from Usuario as u where u.login = '" + login + "' and u.senha ='" + sMd5 + "'")
						.list().get(0);

			} else {
				ObjLocalizado = (Usuario) session.getCurrentSession()
						.createQuery("from Usuario as u where u.id = " + id).list().get(0);
			}

			if (ObjLocalizado != null) {
				return ObjLocalizado;
			}

		} catch (Exception e) {
			return null;
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
