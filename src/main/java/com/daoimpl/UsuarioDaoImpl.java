package com.daoimpl;

import java.math.BigInteger;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.daoapi.UsuarioDao;
import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPesquisa;
import com.entities.Usuario;
import com.mysql.jdbc.Connection;

@Repository
@Transactional
public class UsuarioDaoImpl implements UsuarioDao {

	@Autowired
	SessionFactory session;

	@SuppressWarnings("unchecked")
	public List<Usuario> lista() {
		return session.getCurrentSession().createQuery("from Usuario").list();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	public DtoRetornoPaginado<Usuario> list(Integer pagina, DtoUsuarioPesquisa dto) {

		// Quantidade á ser pulada
		Integer offset = 10;

		@SuppressWarnings("rawtypes")
		DtoRetornoPaginado inst = new DtoRetornoPaginado();

		// # Preparar dados para retorno
		String parametrosAdicionais = "";
		String filtros = "";
		String ordenacao = "";

		// Prepara Filtros
		if (dto.getCod() != null) {
			filtros = "as u where u.id='" + dto.getCod() + "'";
		}

		if (dto.getNome() != "" && dto.getNome() != null) {
			if (filtros != "") {
				filtros = filtros + " and u.nome='" + dto.getNome() + "'";
			} else {
				filtros = "as u where u.nome='" + dto.getNome() + "'";
			}
		}

		if (dto.getLogin() != "" && dto.getLogin() != null) {
			if (filtros != "") {
				filtros = filtros + " and u.login='" + dto.getLogin() + "'";
			} else {
				filtros = "as u where u.login='" + dto.getLogin() + "'";
			}
		}

		if (dto.getAtivo() != null) {
			if (filtros != "") {
				filtros = filtros + " and u.ativo='" + dto.getAtivo() + "'";
			} else {
				filtros = "as u where u.ativo='" + dto.getAtivo() + "'";
			}
		}

		if (dto.getEmail() != "" && dto.getEmail() != null) {
			if (filtros != "") {
				filtros = filtros + " and u.email='" + dto.getEmail() + "'";
			} else {
				filtros = "as u where u.email='" + dto.getEmail() + "'";
			}
		}

		// Incluir filtros aos parâmetros caso há algum preenchido
		if (filtros != null || filtros != "") {
			parametrosAdicionais = filtros;
		}

		// Ordenação
		if (dto.getColunaParaOrdenar() != null && dto.getColunaParaOrdenar() != "") {
			if (parametrosAdicionais != "") {
				parametrosAdicionais = parametrosAdicionais + "order by u." + dto.getColunaParaOrdenar() + " desc";
			} else {
				parametrosAdicionais = "as u order by u." + dto.getColunaParaOrdenar() + " desc";
			}
		}

		// Consulta sem filtro
		Integer quantidade = 0;
		if (filtros == "") {
			// Quantidade Total de Registros
			quantidade = session.getCurrentSession().createQuery("from Usuario as u").list().size();
			inst.setQtdTotalDeRegistros(quantidade);

			// Quantidade de Registros Encontrados na Página
			inst.setQtdRegistroPagina(session.getCurrentSession().createQuery("from Usuario").setMaxResults(offset)
					.setFirstResult(pagina * offset).list().size());
		}

		if (parametrosAdicionais != "") {
			inst.setLista(session.getCurrentSession().createQuery("from Usuario " + parametrosAdicionais)
					.setMaxResults(offset).setFirstResult(pagina * offset).list());

			if (filtros != "") {
				inst.setQtdRegistroPagina(
						session.getCurrentSession().createQuery("from Usuario " + parametrosAdicionais)
								.setMaxResults(offset).setFirstResult(pagina * offset).list().size());
				quantidade = session.getCurrentSession().createQuery("from Usuario " + parametrosAdicionais).list()
						.size();
				inst.setQtdTotalDeRegistros(quantidade);
			}
		} else {
			inst.setLista(session.getCurrentSession().createQuery("from Usuario as u order by u.id asc")
					.setMaxResults(offset).setFirstResult(pagina * offset).list());
		}
		if (quantidade > 0) {
			Double quantidadeFormatada = quantidade.doubleValue() / offset;
			inst.setNumeroPaginas((int) Math.ceil(quantidadeFormatada));
		}

		return inst;
	}

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
