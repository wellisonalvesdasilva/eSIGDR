package com.daoapi;

import java.util.List;
import java.util.Map;

import com.entities.Alimento;
import com.entities.Usuario;

public interface AlimentoDao {

	public List<Alimento> listAlimentosPorCategoria(Integer tipoAlimento);

	public List<Alimento> list(Map<String, String> objPesquisa);

	Alimento getObj(Integer id);

	boolean deletar(Integer id);

	void merge(Alimento alimento);

	void persist(Alimento alimento);
}