<%@include file="/WEB-INF/views/cabecalho.jsp"%>

<h3>${sucesso}</h3>
<h3>${error}</h3>
<div class="container">
	<h1>Produtos Cadastrados</h1>
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<td>Titulo</td>
			<td>Descricao</td>
			<td>Paginas</td>
		</tr>

		<c:forEach items="${produtos }" var="produto">
			<tr>
				<td><a
					href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}"
					style="text-decoration: none; color: black;">${produto.titulo}</a></td>
				<td>${produto.descricao }</td>
				<td>${produto.paginas }</td>
			</tr>
		</c:forEach>
	</table>

</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${contextPath}resources/js/bootstrap.min.js"></script>
</body>
</html>