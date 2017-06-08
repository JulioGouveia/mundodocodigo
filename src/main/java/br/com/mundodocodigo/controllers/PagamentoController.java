package br.com.mundodocodigo.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.mundodocodigo.modelo.CarrinhoCompras;
import br.com.mundodocodigo.modelo.DadosDoPagamento;

@Controller
@RequestMapping("/pagamento")
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class PagamentoController {

	@Autowired
	private CarrinhoCompras carrinho;

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(value = "/finalizar", method = RequestMethod.POST)
	public Callable<ModelAndView> finalizar(RedirectAttributes model) {
		return () -> {
			try {
				String uri = "http://book-payment.herokuapp.com/payment";

				String resposta = restTemplate.postForObject(uri, new DadosDoPagamento(carrinho.getTotal()),
						String.class);

				System.out.println(resposta);
				model.addFlashAttribute("sucesso", resposta);

				return new ModelAndView("redirect:/");
			} catch (HttpClientErrorException e) {

				e.getStackTrace();

				model.addFlashAttribute("error", "Valor de compra maior que o permitido [max:500]");

				return new ModelAndView("redirect:/");
			}

		};
	}

}
