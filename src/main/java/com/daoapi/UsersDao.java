package com.daoapi;

import java.util.List;
import java.util.Map;

import com.entities.Users;

public interface UsersDao {

	public List<Users> list(Map<String, String> objPesquisa);

	Users getObj(Integer id);

	boolean deletar(Integer id);

	void merge(Users users);

	void persist(Users users);
}