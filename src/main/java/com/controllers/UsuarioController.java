package com.controllers;

import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

import com.dtos.DtoRetornoPaginado;
import com.dtos.DtoUsuarioPaginado;
import com.dtos.DtoUsuarioPesquisa;
import com.entities.Usuario;
import com.servicesapi.UsuarioService;

@Controller
@RequestMapping("/home/usuario")
@SessionAttributes("roles")

public class UsuarioController {

	@Autowired
	UsuarioService _usuarioService;

	@RequestMapping(value = "/consultar", method = { RequestMethod.GET })
	public ModelAndView consultar() {
		return new ModelAndView("usuario/consultar");
	}

	@RequestMapping(value = "/listar/{pagina}", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody DtoRetornoPaginado<Usuario> listar(@PathVariable("pagina") Integer pagina,
			@RequestBody(required = false) String colunaParaOrdenar) {

		return _usuarioService.list(pagina, colunaParaOrdenar);

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
		return "redirect:/home/usuario/cadastrar";
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.GET })
	public ModelAndView editarAviso(@PathVariable("cod") Integer cod, ModelMap model) throws NoSuchAlgorithmException {
		model.addAttribute("obj", _usuarioService.getObj(cod, null, null));
		return new ModelAndView("usuario/editar");
	}

	@RequestMapping(value = "/editar/{cod}", method = { RequestMethod.POST })
	public String updateAviso(@ModelAttribute("obj") Usuario objMerge, RedirectAttributes ra) throws Exception {
		_usuarioService.saveOrUpdate(objMerge);
		ra.addFlashAttribute("message", "Registro editado com sucesso!");
		return "redirect:/home/usuario/consultar";
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