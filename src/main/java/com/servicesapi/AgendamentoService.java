package com.servicesapi;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import com.entities.Agendamento;

public interface AgendamentoService {
	List<Agendamento> list(Map<String, String> objPesquisa);

	public boolean saveOrUpdate(Agendamento agendamento)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException;

	Boolean deletar(Integer cod);

	Object getObj(Integer id);

}
