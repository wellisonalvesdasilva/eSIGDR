package com.servicesimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.daoapi.VendaDao;
import com.entities.Venda;
import com.servicesapi.VendaService;

@Service
public class VendaServiceImpl implements VendaService {

	@Autowired
	VendaDao _vendaDao;

	public List<Venda> getVendas() {
		return _vendaDao.list();
	}

}