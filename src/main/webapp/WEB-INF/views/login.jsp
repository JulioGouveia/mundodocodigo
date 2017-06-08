<%@include file="/WEB-INF/views/cabecalho.jsp" %>
<body>
	<div class="container">
		<h1>Acesso restrito mundo do Codigo</h1>
		<form:form servletRelativeAction="/login" method="post">
			<div class="form-group">
				<label>Nome</label> <input type="text" name="username"
					class="form-control" />
			</div>
			<div class="form-group">
				<label>Senha</label> <input type="password" name="password"
					class="form-control" />
			</div>
			<button type="submit" class="btn btn-primary">Logar</button>
		</form:form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${contextPath}resources/js/bootstrap.min.js"></script>
</body>
</html>