package com.servicesimpl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.HashMap;
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

	public Map<String, List<Alimento>> getAlimentos() {

		Map<String, List<Alimento>> novaInstancia = new HashMap<String, List<Alimento>>();

		List<Alimento> alimentosBasicos = _alimentoDao.listAlimentosPorCategoria(1);
		List<Alimento> carnes = _alimentoDao.listAlimentosPorCategoria(2);
		List<Alimento> verduras = _alimentoDao.listAlimentosPorCategoria(3);

		novaInstancia.put("basicos", alimentosBasicos);
		novaInstancia.put("carnes", carnes);
		novaInstancia.put("verduras", verduras);

		return novaInstancia;

	}

	public List<Alimento> list(Map<String, String> objPesquisa) {
		return _alimentoDao.list(objPesquisa);
	}

	public boolean saveOrUpdate(Alimento alimento, Integer cod)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException {

		if (cod != null) {
			Alimento objLocalizado = _alimentoDao.getObj(cod);
			objLocalizado.setTitulo(alimento.getTitulo());
			objLocalizado.setCategoria_id(alimento.getCategoria_id());
			_alimentoDao.merge(objLocalizado);
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