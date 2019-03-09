package com.servicesimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daoapi.CategoriaDao;
import com.entities.Categoria;
import com.servicesapi.CategoriaService;

@Service
public class CategoriaServiceImpl implements CategoriaService {

	@Autowired
	CategoriaDao _categoriaDao;

	public List<Categoria> getCategorias() {
		return _categoriaDao.list();
	}

}