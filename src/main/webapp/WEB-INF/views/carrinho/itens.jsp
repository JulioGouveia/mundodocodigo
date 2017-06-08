<%@include file="/WEB-INF/views/cabecalho.jsp" %>
<div class="container meuCarrinho">
	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>
		<table id="cart-table">
			<colgroup>
				<col class="item-col" />
				<col class="item-price-col" />
				<col class="item-quantity-col" />
				<col class="line-price-col" />
				<col class="delete-col" />
			</colgroup>
			<thead>
				<tr>
					<th class="cart-img-col"></th>
					<th width="65%">Item</th>
					<th width="10%">Preço</th>
					<th width="10%">Quantidade</th>
					<th width="10%">Total</th>
					<th width="5%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carrinhoCompras.itens }" var="item">
					<tr>
						<td class="cart-img-col"><img
							src="${item.produto.capaPath} "
							width="71px" height="100px" /></td>
						<td class="item-title">${item.produto.titulo}</td>
						<td class="numeric-cell">${item.tipoPreco}</td>
						<td class="quantity-input-cell"><input type="number" min="0"
							readonly="readonly" id="quantidade" name="quantidade"
							value="${carrinhoCompras.getQuantidade(item)}" /></td>
						<td class="numeric-cell">R$ ${carrinhoCompras.getTotal(item)}</td>
						<td class="remove-item">
							<form:form action="${s:mvcUrl('CCC#remover').arg(0, item.produto.id).arg(1, item.tipoPreco).build() }" method="post">
								<input type="submit" alt="Excluir" title="Excluir" value="excluir"/>
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<form action="${s:mvcUrl('PC#finalizar').build()}" method="POST">
							<input type="submit" class="checkout" name="checkout"
								value="Finalizar compra" />
						</form>
					</td>

					<td class="quantity-input-cell"><input type="submit"
						class="update-cart" disabled="disabled" name="update" value="" /></td>
					<td class="numeric-cell">${carrinhoCompras.total}</td>
					<td></td>
				</tr>
			</tfoot>
		</table>

		<h2>Você já conhece os outros livros da Casa do Código?</h2>


		<h2>
			<a href="${s:mvcUrl('HC#index').build()}">Veja todos os livros que
				publicamos!</a>
		</h2>
	</section>
</div>	
<%@include file="/WEB-INF/views/rodape.jsp" %>