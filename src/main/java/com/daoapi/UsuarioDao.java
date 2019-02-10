package com.daoapi;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.entities.Usuario;

public interface UsuarioDao {

	public List<Usuario> list(Map<String, String> objPesquisa);

	Usuario getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException;

	boolean deletar(Integer id);

	void merge(Usuario users);

	void persist(Usuario users);
}