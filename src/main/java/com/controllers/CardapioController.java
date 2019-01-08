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
@RequestMapping("cardapio")
public class CardapioController {

	@Autowired
	private CategoriaService _categoriaService;

	@Autowired
	private AlimentoService _alimentoService;

	@Autowired
	private CardapioService _cardapioService;

	@RequestMapping(value = "/consultar", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView consultar(@RequestParam Map<String, String> objPesquisa, ModelMap model) {
		model.addAttribute("lista", _cardapioService.list(objPesquisa));
		return new ModelAndView("cardapio/consultar");
	}

	@RequestMapping(value = "/montar", method = { RequestMethod.GET })
	public ModelAndView consultar(ModelMap model) {
		model.addAttribute("obj", new DtoMontarCardapio());
		model.addAttribute("listCategorias", _categoriaService.getCategorias());
		model.addAttribute("alimento", _alimentoService.list(null));
		return new ModelAndView("cardapio/montar");
	}

	@RequestMapping(value = "/montar", method = RequestMethod.POST)
	public String enviar(@ModelAttribute("obj") DtoMontarCardapio obj, RedirectAttributes ra, ModelMap model) {
		_cardapioService.criarCardapio(obj);
		ra.addFlashAttribute("message", "Registro cadastrado com sucesso!");
		return "redirect:/cardapio/montar";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
