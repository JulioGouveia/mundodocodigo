<%@include file="/WEB-INF/views/cabecalho.jsp"%>

<article id="${produto.id} }">
	<header id="product-highlight" class="clearfix">
		<div id="product-overview" class="container">
			<img width="280px" height="395px" src="${pathCapa}"
				class="product-featured-image" />
			<h1 class="product-title">${produto.titulo}</h1>
			<p class="product-author">
				<span class="product-author-link"> </span>
			</p>

			<p class="book-description">${produto.descricao}</p>
		</div>
	</header>


	<section class="buy-options clearfix">
		<form:form servletRelativeAction="/carrinho/add" method="post"
			cssClass="container">
			<ul id="variants" class="clearfix">
				<input type="hidden" name="produtoId" value="${produto.id}" />
				<c:forEach items="${produto.precos}" var="preco">
					<li class="buy-option"><input type="radio" name="tipo"
						class="variant-radio" id="tipo" value="${preco.tipo}"
						checked="checked" /> <label class="variant-label">
							${preco.tipo} </label> <small class="compare-at-price"> R$ 59,90
					</small>
						<p class="variant-price">${preco.valor}</p></li>
				</c:forEach>
			</ul>
			<button type="submit" class="submit-image icon-basket-alt"
				alt="Compre Agora" title="Compre Agora${produto.titulo}"></button>
		</form:form>

	</section>


	<section class="data product-detail">
		<h2 class="section-title">Dados do livro:</h2>
		<p>
			Numero de paginas: <span>${produto.paginas}</span>
		</p>
		<p></p>
		<p>Data de publicacao: ${dataFormatada}</p>
	</section>
	</div>

</article>

<%@include file="/WEB-INF/views/rodape.jsp"%>