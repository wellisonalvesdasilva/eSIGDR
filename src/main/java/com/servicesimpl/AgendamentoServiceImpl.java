package com.servicesimpl;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.daoapi.AgendamentoDao;
import com.entities.Agendamento;
import com.servicesapi.AgendamentoService;

@Service
public class AgendamentoServiceImpl implements AgendamentoService {

	@Autowired
	AgendamentoDao _agendamentoDao;

	public List<Agendamento> list(Map<String, String> objPesquisa) {
		return _agendamentoDao.list(objPesquisa);
	}

	public boolean saveOrUpdate(Agendamento agendamento)
			throws NoSuchAlgorithmException, IllegalAccessException, InvocationTargetException {

		if (agendamento.getId() != null) {
			_agendamentoDao.merge(agendamento);
		} else {
			_agendamentoDao.persist(agendamento);
		}
		return true;
	}

	public Boolean deletar(Integer cod) {
		return _agendamentoDao.deletar(cod);
	}

	public Object getObj(Integer id) {
		return _agendamentoDao.getObj(id);
	}

}