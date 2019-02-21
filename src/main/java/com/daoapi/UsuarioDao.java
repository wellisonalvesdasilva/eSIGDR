package com.daoapi;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPaginado;
import com.dtos.DtoUsuarioPesquisa;
import com.entities.Usuario;

public interface UsuarioDao {

	public DtoRetornoPaginado<Usuario> list(Integer pagina, DtoUsuarioPesquisa dto);

	Usuario getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException;

	boolean deletar(Integer id);

	void merge(Usuario users);

	void persist(Usuario users);
}