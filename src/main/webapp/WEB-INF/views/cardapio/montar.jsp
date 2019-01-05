<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta http-equiv="cache-control" content="public" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes">

<title>eSIGDR - Sistema Informatizado Gerenciador de
	Restaurantes</title>

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />

<script type="text/javascript" charset="utf8"
	src="${pageContext.request.contextPath}/resources/datatables/jquery-3.3.1.js"></script>

<script type="text/javascript" charset="utf8"
	src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.min.js"></script>

<script type="text/javascript" charset="utf8"
	src="${pageContext.request.contextPath}/resources/datatables/dataTables.material.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/datatables/material.min.css">
<link
	href="${pageContext.request.contextPath}/resources/datatables/dataTables.material.min.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/light-bootstrap-dashboard.css?v=2.0.1"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/demo.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath}/resources/js/core/popper.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap-switch.js"></script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/plugins/chartist.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap-notify.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/light-bootstrap-dashboard.js?v=2.0.1"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/demo.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/demo.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/datepicker/jquery-ui.css">

<script
	src="${pageContext.request.contextPath}/resources/datepicker/jquery-1.12.4.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datepicker/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datepicker/jquery.mask.min.js"></script>

</head>


<body>
	<div class="wrapper">
		<div class="sidebar"
			data-image="${pageContext.request.contextPath}/resources/img/sidebar-5.jpg">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="http://www.creative-tim.com" class="simple-text">
						e-SIGDR (RESTAURANTE)</a>
				</div>
				<ul class="nav">
					<li><a class="nav-link" href="#"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>Dashboard</p>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="/SpringMVC/cardapio/montar"> <i class="nc-icon nc-notes"></i>
							<p>Montar Cardápio</p>
					</a></li>

					<li><a class="nav-link" href="#"> <i
							class="nc-icon nc-single-copy-04"></i>
							<p>Lista de Cardápios</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-cart-simple"></i>
							<p>Nova Venda</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-watch-time"></i>
							<p>Agendar Retirada</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-single-02"></i>
							<p>Gerenciar Clientes</p>
					</a></li>

					<li><a class="nav-link" href="#"> <i
							class="nc-icon nc-apple"></i>
							<p>Gerenciar Alimentos</p>
					</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/SpringMVC/users"> <i class="nc-icon nc-circle-09"></i>
							<p>Gerenciar Usuários</p>
					</a></li>

					<li class="nav-item active active-pro"><a
						class="nav-link active" href="#"> <i
							class="nc-icon nc-chart-bar-32"></i>
							<p>Visualizar Relatórios</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class=" container-fluid  ">
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<ul class="nav navbar-nav mr-auto">
							<li class="dropdown nav-item">
							<li class="nav-item"><span class="no-icon">Versão
									1.0.0.0</span> </a></li>

						</ul>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span
									class="no-icon">Minha Conta</span>
							</a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Alterar Senha</a> <a
										class="dropdown-item" href="#">Alterar Dados</a>
								</div></li>
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">Sair</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card strpied-tabled-with-hover">
								<div class="card-header ">
									<h4 class="card-title">Montar Cardápio</h4>
								</div>
								<div class="card-body">
									<form:form method="POST" modelAttribute="obj">
										<div class="row">
											<div class="col-md-2 pr-1">
												<div class="form-group">
													<label>Data</label> <input autocomplete="off"
														placeholder="DD/MM/AAAA" id="data" name="data" type="text"
														class="form-control dataMask" placeholder="Código">
												</div>
											</div>
											<div class="col-lg-3 pl-1">
												<div class="form-group">
													<label>Categoria</label> <select id="idCategoria"
														name="idCategoria" class="form-control">
														<option value="">Selecione um valor</option>
														<c:forEach var="it" items='${listCategorias}'>
															<option value="${it.id}"
																<c:choose><c:when test="${idCategoria == it.id}">selected</c:when></c:choose>>${it.titulo}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-7 pl-1">
												<div class="form-group">
													<label>Titulo</label> <input type="text" maxlength="40"
														minlength="1" id="titulo" name="titulo"
														class="form-control" placeholder="Nome">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="comment">Descrição:</label>
													<textarea class="form-control" id="descricao"
														name="descricao" rows="2"
														placeholder="Informe os Detalhes" maxlength="1000"
														name="texto"></textarea>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>Valor (R$)</label> <input autocomplete="off"
														placeholder="Valor" id="valor" name="valor" type="text"
														class="form-control dataMask"
														placeholder="Informe o valor R$">
												</div>
											</div>
										</div>

										<div class="row">
											<div id="divAlimentos" class="col-lg-12">
												<label>Selecione os alimento(s):</label> <input
													id="txtAlimento" onkeyup="filtrarAlimentos()" type="text"
													placeholder="Faça uma pesquisa"
													class="form-control input-sm">
												<div
													style="min-height: 0px; max-height: 125px; border: 1px solid #ddd; overflow-y: scroll;">
													<c:forEach var="it" items='${alimento}'>
														<div class="alimentosToShow" name="${it.titulo}">
															<spam style='font-family:helvetica;'>
															&nbsp;&nbsp;&nbsp;<input type="checkbox"
																id="listAlimentos" name="listAlimentos" value="${it.id}" />
															<span class="cursor-hand ng-binding">${it.titulo}</span></spam>
														</div>
													</c:forEach>
												</div>
												<div class="text-right">
													<input type="checkbox" onclick="selecionarTodosAlimentos()"
														id="selectAll" /> <span>Selecionar todos</span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-5">
												<a name="btnSubmit" href='/SpringMVC/users' type="button"
													class="btn btn-warning btn-fill"> <i
													class="nc-icon nc-stre-left"></i> Voltar
												</a>
												<button name="btnSubmit" type="submit" id="btnSubmit"
													type="button" class="btn btn-success btn-fill">
													<i class="nc-icon nc-send"></i> Salvar
												</button>
												<a name="btnSubmit" href='/SpringMVC/users/cadastrar'
													id="btnSubmit" type="submit" class="btn btn-info btn-fill">
													<i class="nc-icon nc-refresh-02"></i> Limpar
												</a>
											</div>
											<div class="col-md-7"></div>
										</div>
										<div class="clearfix"></div>
								</div>
							</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<nav>
				<p class="copyright text-center">
					©
					<script>
						document.write(new Date().getFullYear())
					</script>
					Desenvolvido por<a href="#"> Wellison Silva</a> em Spring MVC
					(Java)
				</p>
			</nav>
		</div>
	</footer>
</body>
<script>
	function selecionarTodosAlimentos() {
		var lista = document.querySelectorAll('input[name=listAlimentos]');
		var empty = [].filter.call(lista, function(el) {
			el.checked = document.getElementById('selectAll').checked;
		});
	}

	function filtrarAlimentos() {
		var lista = document.getElementsByClassName('alimentosToShow');
		var textoParaPesquisar = document.getElementById('txtAlimento').value;

		Array.prototype.forEach.call(lista, function(el) {

			if (el.getAttribute("name").toUpperCase().includes(
					textoParaPesquisar.toUpperCase())) {
				el.style.visibility = 'visible';
				el.style.position = 'relative';
			} else {
				el.style.visibility = 'hidden';
				el.style.position = 'absolute';
			}
		});

		//var listaParaExibir = document.getElementsByName('[name^='+ textoParaPesquisar +']');
		//.style.visibility = 'visible';
	}

	// DatePicker
	$('#data').mask('00/00/0000');

	$(function() {
		$('#data').datepicker(
				{
					dateFormat : 'dd/mm/yy',
					dayNames : [ 'Domingo', 'Segunda', 'Terça', 'Quarta',
							'Quinta', 'Sexta', 'Sábado' ],
					dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D' ],
					dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
							'Sáb', 'Dom' ],
					monthNames : [ 'Janeiro', 'Fevereiro', 'Março', 'Abril',
							'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro',
							'Outubro', 'Novembro', 'Dezembro' ],
					monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai',
							'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
					nextText : 'Próximo',
					prevText : 'Anterior',
					onClose : function(dateText, inst) {
						if (!validaDat(dateText)) {
							$('#btnSubmit').prop("disabled", "disabled");
						} else {
							$('#btnSubmit').prop("disabled", "");
						}
					}
				});

	});

	function validaDat(valor) {
		var date = valor;
		var ardt = new Array;
		var ExpReg = new RegExp(
				"(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
		ardt = date.split("/");
		erro = false;
		if (date.search(ExpReg) == -1) {
			erro = true;
		} else if (((ardt[1] == 4) || (ardt[1] == 6) || (ardt[1] == 9) || (ardt[1] == 11))
				&& (ardt[0] > 30))
			erro = true;
		else if (ardt[1] == 2) {
			if ((ardt[0] > 28) && ((ardt[2] % 4) != 0))
				erro = true;
			if ((ardt[0] > 29) && ((ardt[2] % 4) == 0))
				erro = true;
		}
		if (erro) {
			return false;
		}
		return true;
	}
</script>
</body>
</html>