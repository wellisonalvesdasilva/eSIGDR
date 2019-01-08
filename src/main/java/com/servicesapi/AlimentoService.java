package com.servicesapi;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.entities.Alimento;
import com.entities.Alimento;

public interface AlimentoService {
	List<Alimento> list(Map<String, String> objPesquisa);

	public boolean saveOrUpdate(Alimento users)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException;

	Boolean deletar(Integer cod);

	Object getObj(Integer id);

}
