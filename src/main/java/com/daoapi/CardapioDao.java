package com.daoapi;

import java.util.List;
import java.util.Map;

import com.entities.Cardapio;

public interface CardapioDao {
	public List<Cardapio> list(Map<String, String> objPesquisa);

	void persist(Cardapio obj);
}