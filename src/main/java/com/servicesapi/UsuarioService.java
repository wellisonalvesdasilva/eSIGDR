package com.servicesapi;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.entities.Usuario;

public interface UsuarioService {
	public List<Usuario> list(Map<String, String> objPesquisa);

	public boolean saveOrUpdate(Usuario users) throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException;

	Boolean deletar(Integer cod);

	Object getObj(Integer id);

	void alterarSenha(Integer cod, String novaSenha) throws Exception;
}