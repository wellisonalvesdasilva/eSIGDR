package com.servicesapi;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.entities.Cliente;
import com.entities.Usuario;

public interface ClienteService {
	public List<Cliente> list(Map<String, String> objPesquisa);

	public boolean saveOrUpdate(Cliente users)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException;

	Boolean deletar(Integer cod);

	Object getObj(Integer id);

}