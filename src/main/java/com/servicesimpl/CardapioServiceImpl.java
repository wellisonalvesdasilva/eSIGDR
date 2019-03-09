package com.servicesimpl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daoapi.CardapioDao;
import com.daoapi.CategoriaDao;
import com.dtos.DtoMontarCardapio;
import com.entities.Cardapio;
import com.entities.CardapioAlimento;
import com.servicesapi.CardapioService;

@Service
public class CardapioServiceImpl implements CardapioService {

	@Autowired
	CardapioDao _cardapioDao;

	@Autowired
	CategoriaDao _categoriaDao;

	public List<Cardapio> list(Map<String, String> objPesquisa) {
		return _cardapioDao.list(objPesquisa);
	}

	public void criarCardapio(DtoMontarCardapio obj) {
		Cardapio insCardapio = new Cardapio();
		insCardapio.setData(obj.getData());
		insCardapio.setDescricao(obj.getDescricao());
		insCardapio.setValor(obj.getValor());
		insCardapio.setTitulo(obj.getTitulo());

		for (int alimento_id : obj.getListAlimentos()) {
			insCardapio.AdicionarFilhos(instanciarCardapioAlimento(alimento_id));
		}

		for (int alimento_id : obj.getListCarnes()) {
			insCardapio.AdicionarFilhos(instanciarCardapioAlimento(alimento_id));
		}

		for (int alimento_id : obj.getListCarnes()) {
			insCardapio.AdicionarFilhos(instanciarCardapioAlimento(alimento_id));
		}

		_cardapioDao.persist(insCardapio);
	}

	private CardapioAlimento instanciarCardapioAlimento(Integer alimento_id) {
		CardapioAlimento instIntermediary = new CardapioAlimento();
		instIntermediary.setAlimento_id(alimento_id);
		return instIntermediary;
	}

}