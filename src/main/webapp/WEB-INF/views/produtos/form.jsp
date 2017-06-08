<%@include file="/WEB-INF/views/cabecalho.jsp"%>
<div class="container">
	<h1>Cadastro de Produtos</h1>
	<form:form action="${s:mvcUrl('PC#gravar').build()}" method="post"
		commandName="produto" enctype="multipart/form-data">
		<div>
			<label>Título</label>
			<form:input path="titulo" cssClass="form-control" />
			<form:errors path="titulo" />
		</div>
		<div>
			<label>Descrição</label>
			<form:textarea path="descricao" cssClass="form-control" />
			<form:errors path="descricao" />
		</div>
		<div>
			<label>Páginas</label>
			<form:input path="paginas" cssClass="form-control" />
			<form:errors path="paginas" />
		</div>
		<div>
			<label>Data de lançamento</label> <input name="dataLancamento"
				type="text" class="form-control " />
			<form:errors path="dataLancamento" />
		</div>

		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div>
				<label>${tipoPreco}</label>
				<form:input path="precos[${status.index}].valor"
					cssClass="form-control" />
				<form:input type="hidden" path="precos[${status.index}].tipo"
					value="${tipoPreco}" />
			</div>
		</c:forEach>

		<div>
			<label>Capa</label> <input type="file" name="capaFile"
				class="form-control" />
		</div>

		<button type="submit" class="btn btn-primary">Cadastrar</button>
	</form:form>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${contextPath}resources/js/bootstrap.min.js"></script>
</body>
</html>