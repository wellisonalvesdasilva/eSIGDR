package com.servicesimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.daoapi.CardapioDao;
import com.daoapi.CategoriaDao;
import com.dtos.DtoMontarCardapio;
import com.entities.Cardapio;
import com.entities.CardapioAlimento;
import com.entities.Categoria;
import com.servicesapi.CardapioService;

@Service
public class CardapioServiceImpl implements CardapioService {

	@Autowired
	CardapioDao _cardapioDao;

	@Autowired
	CategoriaDao _categoriaDao;

	public void criarCardapio(DtoMontarCardapio obj) {

		// Categoria objLocalizado = _categoriaDao.getObj(obj.getCategoria());

		Cardapio insCardapio = new Cardapio();
		insCardapio.setData(obj.getData());
		insCardapio.setCategoria_id(obj.getIdCategoria());
		insCardapio.setDescricao(obj.getDescricao());
		insCardapio.setTitulo(obj.getTitulo());

		for (int alimento_id : obj.getListAlimentos()) {
			CardapioAlimento instIntermediary = new CardapioAlimento();
			instIntermediary.setAlimento_id(alimento_id);
			insCardapio.AdicionarFilhos(instIntermediary);
		}
		_cardapioDao.persist(insCardapio);
	}

}