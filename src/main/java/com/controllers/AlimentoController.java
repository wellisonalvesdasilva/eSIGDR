package com.controllers;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.entities.Alimento;
import com.servicesapi.AlimentoService;
import com.servicesapi.CategoriaService;

@Controller
@RequestMapping("/home/alimento")
@SessionAttributes("roles")
public class AlimentoController {

	@Autowired
	CategoriaService _categoriaService;

	@Autowired
	AlimentoService _alimentoService;

	@RequestMapping(value = "/consultar", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView consultar(@RequestParam Map<String, String> objPesquisa, ModelMap model) {
		model.addAttribute("lista", _alimentoService.list(objPesquisa));
		return new ModelAndView("alimento/consultar");
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.GET })
	public ModelAndView inserirAlimento(ModelMap model) {
		model.addAttribute("obj", new Alimento());
		model.addAttribute("categorias", _categoriaService.getCategorias());
		return new ModelAndView("alimento/cadastrar");
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.POST })
	public String enviar(@ModelAttribute("obj") Alimento obj, RedirectAttributes ra, ModelMap model) throws Exception {
		_alimentoService.saveOrUpdate(obj, null);
		ra.addFlashAttribute("message", "Registro cadastrado com sucesso!");
		return "redirect:/home/alimento/cadastrar";
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.GET })
	public ModelAndView editarAviso(@PathVariable("cod") Integer cod, ModelMap model) {
		model.addAttribute("obj", _alimentoService.getObj(cod));
		model.addAttribute("categorias", _categoriaService.getCategorias());
		return new ModelAndView("alimento/editar");
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.POST })
	public String updateAviso(@PathVariable("cod") Integer cod, @ModelAttribute("obj") Alimento objMerge,
			RedirectAttributes ra) throws Exception {
		_alimentoService.saveOrUpdate(objMerge, cod);
		ra.addFlashAttribute("message", "Registro editado com sucesso!");
		return "redirect:/home/alimento/consultar";
	}

	@RequestMapping(value = "/excluir/{cod}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void excluir(@PathVariable("cod") Integer cod) {

		try {
			_alimentoService.deletar(cod);

		} catch (Exception e) {
			return;
		}

	}

}