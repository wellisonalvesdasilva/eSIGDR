package com.servicesapi;

import java.util.List;
import java.util.Map;

import com.dtos.DtoMontarCardapio;
import com.entities.Cardapio;

public interface CardapioService {

	void criarCardapio(DtoMontarCardapio obj);

	List<Cardapio> list(Map<String, String> objPesquisa);

}
