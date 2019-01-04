<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta http-equiv="cache-control" content="public" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<title>SICAP - Sistema Informatizado de Controle de Atos de
	Pessoal</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Bootstrap theme -->
<link
	href="${pageContext.request.contextPath}/resources/dist/css/bootstrap-theme.css"
	rel="stylesheet">

<!-- não -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/datatables.min.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link
	href="${pageContext.request.contextPath}/resources/dist/css/select2.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/toastr.min.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.mask.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.mask.min.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/datatables.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/dataTables.buttons.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.ui.widget.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/intimacao-upload.js"></script>

<%--não--%>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/buttons.flash.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/pdfmake.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/vfs_fonts.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jszip.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/buttons.print.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/buttons.html5.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/select2.full.js"></script>


<script
	src="${pageContext.request.contextPath}/resources/js/toastr.min.js"></script>

</head>
<body>
	<div class="wrapper">
		<header> </header>
		<nav class="navbar navbar-default" style="height: 100px !important;">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img
						src="${pageContext.request.contextPath}/resources/img/logotipo.png"
						class="img-responsive"></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Importação</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/manager/importacao/">Enviar
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/remessa">Consulta</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Retificação</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/manager/retificacaoRemessa/cadastrar">Solicitação</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/retificacaoRemessa">Consulta</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/remessas-descartadas">
										Admissões Retificadas</a></li>
							</ul></li>
						<li><a
							href="${pageContext.request.contextPath}/manager/intimacao/">Intimação
								<tce:alertaIntimacao />
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/manager/recusas/">Recusa
								<tce:alertaRecusa />
						</a></li>
						<%--<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Calegis</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/manager/calegis">Legislação</a></li>
							</ul></li>--%>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Relatórios</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/plano_cargo">Plano
										de Cargo</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/concurso">Concurso
										Público</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/admissao">Admissão</a></li>

								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/vacancia">Vacância</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/folha_pagamento">Folha
										de Pagamento</a></li>
								<li><a
									href="${pageContext.request.contextPath}/manager/relatorio/pessoa">Buscar
										por CPF</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#"
							class="dropdown-toggle menuMenor" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false"><tce:usuarioLogado /><span
								class="caret"></span> </a>
							<ul class="dropdown-menu semMS">
								<li><a
									href="${pageContext.request.contextPath}/j_spring_security_logout">Sair</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<div class="container line content">
			<div id="carregando" class="modal fade" role="dialog"></div>
			<tiles:insertAttribute name="body" />
		</div>
		<footer>
			<div class="container">
				<div class="row">
					<div
						class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5">
						<img
							src="${pageContext.request.contextPath}/resources/img/tce-ms.png"
							class="img-responsive">
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 address">
						<i class="fa fa-map-marker"></i> Av.: Des. José Nunes da Cunha,
						s/nº - Bloco 29 - CEP 79031-902<br> <i class="fa fa-phone"></i>
						(67) 3317 1500<br> <i class="fa fa-globe"></i>
						www.tce.ms.gov.br
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- /container -->
</body>
</html>