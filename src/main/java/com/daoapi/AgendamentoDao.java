package com.daoapi;

import java.util.List;
import java.util.Map;

import com.entities.Agendamento;

public interface AgendamentoDao {

	public List<Agendamento> list(Map<String, String> objPesquisa);

	Agendamento getObj(Integer id);

	boolean deletar(Integer id);

	void merge(Agendamento Agendamento);

	void persist(Agendamento Agendamento);
}