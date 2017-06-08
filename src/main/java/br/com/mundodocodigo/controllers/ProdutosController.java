package br.com.mundodocodigo.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.mundodocodigo.dao.ProdutoDAO;
import br.com.mundodocodigo.infra.FileSaver;
import br.com.mundodocodigo.modelo.Produto;
import br.com.mundodocodigo.modelo.TipoPreco;
import br.com.mundodocodigo.validation.ProdutoValidation;

@Controller
@RequestMapping("/produtos")
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ProdutosController {

	@Autowired
	private FileSaver saver;

	@Autowired
	private ProdutoDAO produtoDao;

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.addValidators(new ProdutoValidation());

	}

	@RequestMapping("/form")
	public ModelAndView form(Produto produto) {

		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("tipos", TipoPreco.values());
		return modelAndView;
	}

	@CacheEvict(value = "produtoHome", allEntries = true)
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView gravar(MultipartFile capaFile, @Valid Produto produto, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		String filename = capaFile.getOriginalFilename();

		if (bindingResult.hasErrors()) {
			return new ModelAndView("produtos/form");
		}

		String originalFileName = saver.grava("capa-livros", capaFile);
		produto.setCapaPath(originalFileName);
		
		produtoDao.grava(produto);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso");

		return new ModelAndView("redirect:produtos");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar() {

		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		List<Produto> listaProdutos = produtoDao.listar();
		modelAndView.addObject("produtos", listaProdutos);

		return modelAndView;
	}

	@RequestMapping("/detalhes/{id}")
	public ModelAndView detalhe(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("produtos/detalhe");
		Produto produto = produtoDao.find(id);
		modelAndView.addObject("produto", produto);
		String capaPath = "/mundodocodigo/"+produto.getCapaPath();
		modelAndView.addObject("pathCapa", capaPath);
		
		Calendar dataLancamento = produto.getDataLancamento();

		String dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(dataLancamento.getTime());
		modelAndView.addObject("dataFormatada", dataFormatada);

		return modelAndView;
	}

}
