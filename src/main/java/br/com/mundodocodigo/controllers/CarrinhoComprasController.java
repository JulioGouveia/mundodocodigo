package br.com.mundodocodigo.controllers;

import java.io.Serializable;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.mundodocodigo.dao.ProdutoDAO;
import br.com.mundodocodigo.modelo.CarrinhoCompras;
import br.com.mundodocodigo.modelo.CarrinhoItem;
import br.com.mundodocodigo.modelo.Produto;
import br.com.mundodocodigo.modelo.TipoPreco;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)

public class CarrinhoComprasController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private ProdutoDAO produtoDAO;

	@Autowired
	private CarrinhoCompras carrinho;

	@RequestMapping("/add")
	public ModelAndView add(int produtoId, TipoPreco tipo) {
		ModelAndView andView = new ModelAndView("redirect:/carrinho");

		CarrinhoItem carrinhoItem = criaItem(produtoId, tipo);

		carrinho.adicionaNoCarrinho(carrinhoItem);

		return andView;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView carrinho() {
		ModelAndView modelAndView = new ModelAndView("/carrinho/itens");

		Collection<CarrinhoItem> item = carrinho.getItens();

		modelAndView.addObject("item", item);

		return modelAndView;

	}

	private CarrinhoItem criaItem(int produtoId, TipoPreco tipo) {

		Produto produto = produtoDAO.find(produtoId);

		CarrinhoItem carrinhoItem = new CarrinhoItem(produto, tipo);

		return carrinhoItem;
	}

	@RequestMapping("/remover")
	public ModelAndView remover(int produtoId, TipoPreco tipoPreco) {

		carrinho.remove(produtoId, tipoPreco);
		return new ModelAndView("redirect:/carrinho");

	}

}
