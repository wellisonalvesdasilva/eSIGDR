package com.daoapi;

import java.util.List;
import com.entities.Categoria;
import com.entities.Users;

public interface CategoriaDao {

	public List<Categoria> list();
	Categoria getObj(Integer id);

}