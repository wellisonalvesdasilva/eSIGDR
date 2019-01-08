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

import com.entities.Usuario;
import com.servicesapi.UsuarioService;

@Controller
@RequestMapping("usuario")
public class UsuarioController {

	@Autowired
	UsuarioService _usuarioService;

	@RequestMapping(value = "/consultar",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView consultar(@RequestParam Map<String, String> objPesquisa, ModelMap model) {
		model.addAttribute("lista", _usuarioService.list(objPesquisa));
		return new ModelAndView("usuario/consultar");
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.GET })
	public ModelAndView inserirAviso(ModelMap model) {
		model.addAttribute("obj", new Usuario());
		return new ModelAndView("usuario/cadastrar");
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.POST })
	public String enviar(@ModelAttribute("obj") Usuario obj, RedirectAttributes ra, ModelMap model) throws Exception {
		_usuarioService.saveOrUpdate(obj);
		ra.addFlashAttribute("message", "Registro cadastrado com sucesso!");
		return "redirect:/usuario/cadastrar";
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.GET })
	public ModelAndView editarAviso(@PathVariable("cod") Integer cod, ModelMap model) {
		model.addAttribute("obj", _usuarioService.getObj(cod));
		return new ModelAndView("usuario/editar");
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.POST })
	public String updateAviso(@ModelAttribute("obj") Usuario objMerge, RedirectAttributes ra) throws Exception {
		_usuarioService.saveOrUpdate(objMerge);
		ra.addFlashAttribute("message", "Registro editado com sucesso!");
		return "redirect:/usuario";
	}

	@RequestMapping(value = "/excluir/{cod}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void excluir(@PathVariable("cod") Integer cod) {

		try {
			_usuarioService.deletar(cod);

		} catch (Exception e) {
			return;
		}

	}

	@RequestMapping(value = "/alterarSenha/{cod}", method = { RequestMethod.POST })
	public @ResponseBody String alterarSenhaDoUsuario(@PathVariable("cod") Integer cod, @RequestBody String novaSenha) {

		try {
			_usuarioService.alterarSenha(cod, novaSenha);
			return "Senha alterada com sucesso!";

		} catch (Exception e) {
			return e.getMessage();
		}
	}

}