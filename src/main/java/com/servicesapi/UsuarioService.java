package com.servicesapi;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPaginado;
import com.dtos.DtoUsuarioPesquisa;
import com.entities.Usuario;

public interface UsuarioService {
	public DtoRetornoPaginado<Usuario> list(Integer pagina, DtoUsuarioPesquisa dto);

	public boolean saveOrUpdate(Usuario users)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException;

	Boolean deletar(Integer cod);

	Object getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException;

	void alterarSenha(Integer cod, String novaSenha) throws Exception;
}