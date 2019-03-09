package com.servicesimpl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.daoapi.UsuarioDao;
import com.dtoREL.UsuarioREL;
import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPesquisa;
import com.entities.Usuario;
import com.servicesapi.UsuarioService;

import net.sf.jasperreports.engine.JRException;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	UsuarioDao _userDao;

	@SuppressWarnings("unchecked")
	public void exportPdfFile() throws Exception {
		UsuarioREL novo = new UsuarioREL();
		Object retornoBanco = _userDao.lista();
		novo.imprimir((List<Usuario>) retornoBanco);
	}

	public DtoRetornoPaginado<Usuario> list(Integer pagina, DtoUsuarioPesquisa dto) {
		DtoRetornoPaginado<Usuario> retorno = _userDao.list(pagina, dto);
		return retorno;
	}

	public boolean saveOrUpdate(Usuario users)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException {
		users.setDataDeCadastro(Calendar.getInstance().getTime());

		if (users.getId() != null) {
			_userDao.merge(users);
		} else {

			String s = users.getSenha();
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(s.getBytes(), 0, s.length());

			users.setSenha(new BigInteger(1, m.digest()).toString(16));
			_userDao.persist(users);
		}
		return true;
	}

	public Boolean deletar(Integer cod) {
		return _userDao.deletar(cod);
	}

	public Object getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException {
		return _userDao.getObj(id, login, senha);
	}

	public void alterarSenha(Integer cod, String novaSenha) throws Exception {

		Usuario objLocalizado = _userDao.getObj(cod, null, null);

		if (objLocalizado != null) {

			// Senha padrão de 1 a 6 - quando nada for informado
			if (novaSenha.equals("0")) {
				novaSenha = "123456";
			}
			// Converter a senha em MD5
			String s = novaSenha;
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(s.getBytes(), 0, s.length());

			objLocalizado.setSenha(new BigInteger(1, m.digest()).toString(16));

			_userDao.merge(objLocalizado);

		}
	}

}