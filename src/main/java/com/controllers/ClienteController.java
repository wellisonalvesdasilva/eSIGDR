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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entities.Cliente;
import com.servicesapi.ClienteService;

@Controller
@RequestMapping("cliente")
public class ClienteController {

	@Autowired
	ClienteService _clienteService;

	@RequestMapping(value = "/consultar", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView consultar(@RequestParam Map<String, String> objPesquisa, ModelMap model) {
		model.addAttribute("lista", _clienteService.list(objPesquisa));
		return new ModelAndView("cliente/consultar");
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.GET })
	public ModelAndView inserirAviso(ModelMap model) {
		model.addAttribute("obj", new Cliente());
		return new ModelAndView("cliente/cadastrar");
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.POST })
	public String enviar(@ModelAttribute("obj") Cliente obj, RedirectAttributes ra, ModelMap model) throws Exception {
		_clienteService.saveOrUpdate(obj);
		ra.addFlashAttribute("message", "Registro cadastrado com sucesso!");
		return "redirect:/cliente/cadastrar";
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.GET })
	public ModelAndView editarAviso(@PathVariable("cod") Integer cod, ModelMap model) {
		model.addAttribute("obj", _clienteService.getObj(cod));
		return new ModelAndView("cliente/editar");
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.POST })
	public String updateAviso(@ModelAttribute("obj") Cliente objMerge, RedirectAttributes ra) throws Exception {
		_clienteService.saveOrUpdate(objMerge);
		ra.addFlashAttribute("message", "Registro editado com sucesso!");
		return "redirect:/cliente";
	}

	@RequestMapping(value = "/excluir/{cod}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void excluir(@PathVariable("cod") Integer cod) {

		try {
			_clienteService.deletar(cod);

		} catch (Exception e) {
			return;
		}

	}

}