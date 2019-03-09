package com.servicesapi;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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

public interface UsuarioService {

	public void exportPdfFile() throws JRException, IOException, Exception;

	public DtoRetornoPaginado<Usuario> list(Integer pagina, DtoUsuarioPesquisa dto);

	public boolean saveOrUpdate(Usuario users)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException;

	Boolean deletar(Integer cod);

	Object getObj(Integer id, String login, String senha) throws NoSuchAlgorithmException;

	void alterarSenha(Integer cod, String novaSenha) throws Exception;

}