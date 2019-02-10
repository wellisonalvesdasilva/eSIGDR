package com.controllers;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dtos.DtoAutenticacao;
import com.entities.Usuario;
import com.servicesapi.UsuarioService;

@Controller
@RequestMapping(value = "/home")
public class AutenticacaoController {

	@Autowired
	UsuarioService _usuarioService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap model) {
		model.addAttribute("obj", new DtoAutenticacao());
		return "/login/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String logar(@ModelAttribute("obj") DtoAutenticacao obj, RedirectAttributes ra, ModelMap model)
			throws NoSuchAlgorithmException {

		Usuario retornoBanco = (Usuario) _usuarioService.getObj(null, obj.getLogin(), obj.getSenha());

		if (retornoBanco != null) {
			ra.addFlashAttribute("message", "Autenticação realizada com sucesso!");
			return "redirect:/usuario/consultar";
		}

		ra.addFlashAttribute("error", "Verifique os dados informados!");
		return "redirect:/home/login";

	}

}
