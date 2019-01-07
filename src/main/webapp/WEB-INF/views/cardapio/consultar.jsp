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

					<li class="nav-item"><a class="nav-link"
						href="/SpringMVC/cardapio/montar"> <i class="nc-icon nc-notes"></i>
							<p>Montar Cardápio</p>
					</a></li>

					<li><a class="nav-link" href="#"> <i
							class="nc-icon nc-single-copy-04"></i>
							<p>Listar Cardápios</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-cart-simple"></i>
							<p>Gerenciar Vendas</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-delivery-fast"></i>
							<p>Listar Agendamentos</p>
					</a></li>


					<li><a class="nav-link" href="#"> <i
							class="nc-icon nc-apple"></i>
							<p>Gerenciar Alimentos</p>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
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
									<h4 class="card-title">Gerenciamento de Cardápios</h4>
								</div>
								<div class="card-body">
									<form:form method="POST" cssClass='form-horizontal'>
										<div class="row">
											<div class="col-md-2 pr-1">
												<div class="form-group">
													<label>Data</label> <input id="id" maxlength="5"
														minlength="1" value='${(fn:escapeXml(param.id))}'
														name="id" type="text" class="form-control"
														placeholder="Data">
												</div>
											</div>
											<div class="col-md-4 pl-1">
												<div class="form-group">
													<label>Descrição</label> <input type="text" maxlength="40"
														minlength="1" value='${(fn:escapeXml(param.nome))}'
														id="nome" name="nome" class="form-control"
														placeholder="Descrição">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>Titulo</label> <input
														value='${(fn:escapeXml(param.login))}' maxlength="35"
														minlength="1" type="text" id="login" name="login"
														class="form-control" placeholder="Titulo">
												</div>
											</div>
											<div class="col-md-3 pl-1">
												<div class="form-group">
													<label>Categoria</label> <select name="ativo" id="ativo"
														class="form-control">
														<option value="">Selecione</option>
														<option value="1">Sim</option>
														<option value="2">Não</option>
														<option value="2">Não</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-5">
												<button name="btnSubmit" type="submit" id="btnSubmit"
													type="button" rel="tooltip" data-original-title="Pesquisar"
													class="btn btn-info btn-fill">
													<i class="fa fa-search"></i> Pesquisar
												</button>
												<a name="btnLimpar" rel="tooltip"
													data-original-title="Limpar Campos" href='users'
													id="btnLimpar" type="submit"
													class="btn btn-dafault btn-fill"> <i
													class="nc-icon nc-refresh-02"></i> Limpar
												</a> <a name="btnSubmit" rel="tooltip"
													data-original-title="Cadastrar Novo Usuário" id="btnSubmit"
													href='users/cadastrar' type="submit"
													class="btn btn-success btn-fill"> <i
													class="nc-icon nc-simple-add"></i> Novo Cardápio
												</a>
											</div>
											<div class="col-md-7"></div>
										</div>
										<div class="clearfix"></div>
									</form:form>
								</div>
								<div class="row">
									<div class="col-md-12">
										<table id="example" class="mdl-data-table" style="width: 100%">
											<thead>
												<tr>
													<th class="text-center">ID</th>
													<th class="text-center">DATA</th>
													<th class="text-center">NOME DO CARDÁPIO</th>
													<th class="text-center">VALOR</th>
													<th class="text-center">CATEGORIA</th>
													<th class="text-center">AÇÕES</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="it" items="${lista}" varStatus="status">
													<tr>
														<td class="text-center">${it.id}</td>
														<td class="text-center"><fmt:formatDate
																pattern="dd/MM/yyyy" value="${it.data}" />
														<td>${it.titulo}</td>
														<td>R$ ${it.valor}0</td>
														<td class="text-center">${it.categoria.titulo}</td>
														<td class="text-center"><a rel="tooltip"
															data-original-title="Editar" name="btnSubmit"
															id="btnSubmit" href='users/editar/${it.id}' type="button"
															class="btn btn-success btn-fill"> <i
																class="nc-icon nc-settings-tool-66"></i>
														</a>
															<button rel="tooltip" name="btnSubmit"
																data-original-title="Visualizar Detalhes do Prato"
																onclick="resetarSenha(${it.id})" type="button"
																class="btn btn-info btn-fill">
																<i class="nc-icon nc-zoom-split"></i>
															</button>
															<button rel="tooltip" name="btnSubmit"
																data-original-title="Visualizar Alimentos Vìnculados"
																onclick="resetarSenha(${it.id})" type="button"
																class="btn btn-info btn-fill">
																<i class="nc-icon nc-apple"></i>
															</button>
															<button rel="tooltip" name="btnSubmit"
																data-original-title="Visualizar Vendas Vínculadas"
																onclick="resetarSenha(${it.id})" type="button"
																class="btn btn-info btn-fill">
																<i class="nc-icon nc-cart-simple"></i>
															</button>
															<button rel="tooltip" name="btnSubmit"
																data-original-title="Excluir" id="btnSubmit"
																onclick="excluirFuncionario(${it.id})" type="button"
																class="btn btn-danger btn-fill">
																<i class="nc-icon nc-simple-remove"></i>
															</button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
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
		</div>
	</div>
</body>
<script>
var sucessoMessage = "${message}";
if (sucessoMessage != "") {
	showNotification('top', 'right', sucessoMessage);
}

function dataTable() {
		$('#example').DataTable({
			columnDefs : [ {
				"width" : "18%",
				"targets" : 0,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "20%",
				"targets" : 1,
				className : 'mdl-data-table__cell--non-numeric'

			}, {
				"width" : "15%",
				"targets" : 2,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "15%",
				"targets" : 3,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "15%",
				"targets" : 4,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "3%",
				"targets" : 5,
				className : 'mdl-data-table__cell--non-numeric'

			}, ],
		});
	};

	dataTable();
</script>
</body>
</html>