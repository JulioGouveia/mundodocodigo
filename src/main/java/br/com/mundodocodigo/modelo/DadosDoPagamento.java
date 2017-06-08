package br.com.mundodocodigo.modelo;

import java.math.BigDecimal;

public class DadosDoPagamento {

	private BigDecimal value;

	public DadosDoPagamento(BigDecimal value) {
		super();
		this.value = value;
	}

	public DadosDoPagamento() {
	}

	public BigDecimal getValue() {
		return value;
	}

}
