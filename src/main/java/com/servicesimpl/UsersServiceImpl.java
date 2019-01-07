package com.servicesimpl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.daoapi.UsersDao;
import com.entities.Usuario;
import com.servicesapi.UsersService;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDao _userDao;

	public List<Usuario> list(Map<String, String> objPesquisa) {
		return _userDao.list(objPesquisa);
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

	public Object getObj(Integer id) {
		return _userDao.getObj(id);
	}

	public void alterarSenha(Integer cod, String novaSenha) throws Exception {

		Usuario objLocalizado = _userDao.getObj(cod);

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