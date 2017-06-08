<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:url value="/" var="contextPath" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

		<link href="https://plus.googlecom/108540024862647200608"
			rel="publisher"/>
		<title>Livros de Java, SOA, Android, iPhone, Ruby on Rails e
			muito mais - Mundo do Código</title>
		<link href="${contextPath}resources/css/bootstrap.min.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/cssbase-min.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700'
			rel='stylesheet'/>
		<link href="${contextPath}resources/css/fonts.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/layout-colors.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/responsive-style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/guia-do-programador-style.css" 
			rel="stylesheet" type="text/css"  media="all"  />
	    <link href="${contextPath}resources/css/produtos.css" 
	    	rel="stylesheet" type="text/css"  media="all"  />
		<link href="${contextPath}resources/css/book-collection.css"
				rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/menu.css"
		rel="stylesheet" type="text/css" media="all" />

</head>
<body>

	<nav class="navbar navbar-default" id="myTopnav">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Mundo
				do Código</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${s:mvcUrl('HC#index').build()}">Novidades
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Explorar <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${s:mvcUrl('HC#index').build()}">Back-end</a></li>
						<li><a href="${s:mvcUrl('HC#index').build()}">Front-end</a></li>
						<li><a href="${s:mvcUrl('HC#index').build()}">Android</a></li>
						<li><a href="${s:mvcUrl('HC#index').build()}">IOS</a></li>
						<security:authorize access="isAuthenticated()">
							<li role="separator" class="divider"></li>
							<li><a href="${s:mvcUrl('PC#listar').build() }" rel="nofollow">Lista</a></li>
							<li><a href="${s:mvcUrl('PC#form').build() }" rel="nofollow">Cadastro</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="${s:mvcUrl('LC#logout').build() }">logout</a></li>
						</security:authorize>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAuthenticated()">
					<li><a href="#"><security:authentication property="principal.username"/></a></li>
				</security:authorize>
				<li><a href="<c:url value="/carrinho" />">Carrinho(${carrinhoCompras.quantidade})</a></li>
			</ul>
		</div>
	</div>
</nav>
	