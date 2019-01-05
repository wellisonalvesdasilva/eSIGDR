package com.servicesimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.daoapi.AlimentoDao;
import com.entities.Alimento;
import com.servicesapi.AlimentoService;

@Service
public class AlimentoServiceImpl implements AlimentoService {

	@Autowired
	AlimentoDao _alimentoDao;

	public List<Alimento> getAlimentos() {
		return _alimentoDao.list();
	}

}