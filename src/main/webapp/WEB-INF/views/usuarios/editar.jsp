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


<title>eSIGO - Sistema Informatizado Gerenciador de Oficinas</title>

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
						e-SIGAP (Auto Peças) </a>
				</div>
				<ul class="nav">
					<li><a class="nav-link" href="dashboard.html"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a class="nav-link" href="./typography.html"> <i
							class="nc-icon nc-paper-2"></i>
							<p>Ordem de Serviço</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="./table.html"> <i class="nc-icon nc-circle-09"></i>
							<p>Gerenciar Usuários</p>
					</a></li>
					<li><a class="nav-link" href="./icons.html"> <i
							class="nc-icon nc-atom"></i>
							<p>Gerenciar Peças</p>
					</a></li>

					<li><a class="nav-link" href="./icons.html"> <i
							class="nc-icon nc-notes"></i>
							<p>Gerenciar Carros</p>
					</a></li>
					<li><a class="nav-link" href="./maps.html"> <i
							class="nc-icon nc-pin-3"></i>
							<p>Maps</p>
					</a></li>
					<li><a class="nav-link" href="./notifications.html"> <i
							class="nc-icon nc-bell-55"></i>
							<p>Notifications</p>
					</a></li>
					<li class="nav-item active active-pro"><a
						class="nav-link active" href="upgrade.html"> <i
							class="nc-icon nc-alien-33"></i>
							<p>SUPORTE TÉCNICO</p>
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

							<li class="dropdown nav-item"><a href="#"
								class="dropdown-toggle nav-link" data-toggle="dropdown"> <i
									class="nc-icon nc-planet"></i> <span class="notification">5</span>
									<span class="d-lg-none">Notificações</span>
							</a>
								<ul class="dropdown-menu">
									<a class="dropdown-item" href="#">Notification 1</a>
									<a class="dropdown-item" href="#">Notification 2</a>
								</ul></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="nc-icon nc-zoom-split"></i> <span class="d-lg-block">&nbsp;Pesquisar</span>
							</a></li>
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
									<h4 class="card-title">Editar Usuário</h4>
								</div>
								<div class="card-body">
									<form:form method="POST" modelAttribute="obj"
										cssClass='form-horizontal'>
										<div class="row">
											<input type="hidden" value='${obj.id}' name="id" /> <input
												type="hidden" value='${obj.senha}' name="senha" />
											<div class="col-md-5 pl-1">
												<div class="form-group">
													<label>Nome</label> <input type="text" maxlength='40'
														minlength='1' value='${obj.nome}' required id="nome"
														name="nome" class="form-control" placeholder="Nome">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>Login</label> <input maxlength='20' minlength='1'
														value='${obj.login}' type="text" id="login" required
														name="login" class="form-control" placeholder="Login">
												</div>
											</div>
											<div class="col-md-2 pl-1">
												<div class="form-group">
													<label>Ativo</label> <select name="ativo" required
														id="ativo" class="form-control">
														<option value="">Selecione</option>
														<option value="true">Sim</option>
														<option value="false">Não</option>
													</select>
												</div>
											</div>
											<div class="col-md-3 pl-1">
												<div class="form-group">
													<label>Email</label> <input id="email" maxlength='35'
														minlength='1' value='${obj.email}' required name="email"
														type="text" class="form-control" placeholder="E-mail">
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
									</form:form>
								</div>
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
					Aplicação JAVA WEB desenvolvida por<a href="#"> Wellison Silva.</a>
				</p>
			</nav>
		</div>
	</footer>
</body>

<script>



	function showNotification(from, align, msg) {
		color = Math.floor((Math.random() * 4));

		$.notify({
			icon : "nc-icon nc-tap-01",
			message : msg

		}, {
			type : type[color],
			timer : 2500,
			placement : {
				from : from,
				align : align
			}
		});
	}

	var sucessoMessage = "${message}";
	if (sucessoMessage != "") {
		showNotification('top', 'right', 'Registro editado com sucesso!');
	}


	$(document).ready(function() {		
		
		var valor = JSON.stringify(${obj.ativo});
			valor ? document.getElementById("ativo").value = valor : document.getElementById("ativo").value = '';
		
			})
			
</script>
</body>
</html>