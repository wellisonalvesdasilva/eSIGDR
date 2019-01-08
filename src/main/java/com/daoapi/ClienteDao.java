package com.daoapi;

import java.util.List;
import java.util.Map;

import com.entities.Cliente;

public interface ClienteDao {

	public List<Cliente> list(Map<String, String> objPesquisa);

	Cliente getObj(Integer id);

	boolean deletar(Integer id);

	void merge(Cliente users);

	void persist(Cliente users);
}