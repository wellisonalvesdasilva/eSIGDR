package com.controllers;

import java.util.Date;
import java.util.Map;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.dtos.DtoMontarCardapio;
import com.servicesapi.AlimentoService;
import com.servicesapi.CardapioService;
import com.servicesapi.CategoriaService;

@Controller
@RequestMapping("dashboard")
public class DashboardController {

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView consultar(@RequestParam Map<String, String> objPesquisa, ModelMap model) {
		// model.addAttribute("lista", _cardapioService.list(objPesquisa));
		return new ModelAndView("dashboard/index");
	}
}
