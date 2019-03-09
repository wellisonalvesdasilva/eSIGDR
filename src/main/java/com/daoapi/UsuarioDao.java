package com.daoapi;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPaginado;
import com.dtos.DtoUsuarioPesquisa;
import com.entities.Usuario;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;

public interface UsuarioDao {

	public DtoRetornoPaginado<Usuario> list(Integer pagina, DtoUsuarioPesquisa dto);

	public List<Usuario> lista();

	Usuario getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException;

	boolean deletar(Integer id);

	void merge(Usuario users);

	void persist(Usuario users);
}