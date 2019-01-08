package com.servicesimpl;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.daoapi.ClienteDao;
import com.entities.Cliente;
import com.servicesapi.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	ClienteDao _clienteDao;

	public List<Cliente> list(Map<String, String> objPesquisa) {
		return _clienteDao.list(objPesquisa);
	}

	public boolean saveOrUpdate(Cliente users)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException {
		users.setDataDeCadastro(Calendar.getInstance().getTime());

		if (users.getId() != null) {
			_clienteDao.merge(users);
		} else {
			_clienteDao.persist(users);
		}
		return true;
	}

	public Boolean deletar(Integer cod) {
		return _clienteDao.deletar(cod);
	}

	public Object getObj(Integer id) {
		return _clienteDao.getObj(id);
	}

}