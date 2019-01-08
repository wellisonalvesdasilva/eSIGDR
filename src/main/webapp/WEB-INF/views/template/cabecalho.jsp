<!-- Inicio Cabeçalho -->
<title>eSIGDR - Sistema Informatizado Gerenciador de
	Restaurantes</title>
<link href="${pageContext.request.contextPath}/resources/css/css.css"
	rel="stylesheet" />

<script type="text/javascript" charset="utf8"
	src="${pageContext.request.contextPath}/resources/datatables/jquery-3.3.1.js"></script>

<script type="text/javascript" charset="utf8"
	src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.min.js"></script>

<script type="text/javascript" charset="utf8"
	src="${pageContext.request.contextPath}/resources/datatables/dataTables.material.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/datatables/material.min.css">
<link
	href="${pageContext.request.contextPath}/resources/datatables/dataTables.material.min.css"
	rel="stylesheet" />


<link
	href="${pageContext.request.contextPath}/resources/datepicker/jquery-ui.css"
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

					<li class="nav-item"><a class="nav-link"
						href="/SpringMVC/cardapio/montar"> <i class="nc-icon nc-notes"></i>
							<p>Montar Cardápio</p>
					</a></li>

					<li><a class="nav-link" href="/SpringMVC/cardapio/consultar">
							<i class="nc-icon nc-single-copy-04"></i>
							<p>Lista de Cardápios</p>
					</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/SpringMVC/venda/consultar"> <i
							class="nc-icon nc-cart-simple"></i>
							<p>Gerenciar Vendas</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-delivery-fast"></i>
							<p>Gerenciar Pedidos</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="nc-icon nc-single-02"></i>
							<p>Gerenciar Clientes</p>
					</a></li>

					<li><a class="nav-link" href="#"> <i
							class="nc-icon nc-apple"></i>
							<p>Gerenciar Alimentos</p>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="/SpringMVC/usuario"> <i class="nc-icon nc-circle-09"></i>
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

			<!-- Fim Cabeçalho -->