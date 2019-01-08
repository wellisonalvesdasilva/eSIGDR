package com.servicesimpl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.daoapi.AlimentoDao;
import com.entities.Alimento;
import com.servicesapi.AlimentoService;

@Service
public class AlimentoServiceImpl implements AlimentoService {

	@Autowired
	AlimentoDao _alimentoDao;

	public List<Alimento> list(Map<String, String> objPesquisa) {
		return _alimentoDao.list(objPesquisa);
	}

	public boolean saveOrUpdate(Alimento alimento)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException {

		if (alimento.getId() != null) {
			_alimentoDao.merge(alimento);
		} else {

			_alimentoDao.persist(alimento);
		}
		return true;
	}

	public Boolean deletar(Integer cod) {
		return _alimentoDao.deletar(cod);
	}

	public Object getObj(Integer id) {
		return _alimentoDao.getObj(id);
	}

}