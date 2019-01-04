<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
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

<!-- js -->
<link type="text/javascript"
	href="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js" />


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link
	href="${pageContext.request.contextPath}/resources/css/carousel.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
	src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.ui.widget.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/md5.js"></script>
<!-- -->

<script
	src="${pageContext.request.contextPath}/resources/js/jquery.mask.js"></script>

</head>

<body role="document"
	style="background-color: #FFF; width: 100%, overflow:hidden; overflow: -moz-scrollbars-none;">
	<section>
		<div class="navbar-wrapper">
			<div class="container" style="margin-top: -9px !important;">
				<nav class="navbar navbar-custom navbar-static-top"
					style="background-color: #084075 !important; height: 50px; margin-top: 15px;">
					<div class="container-fluid">
						<div class="navbar-header" style="margin-top: -4;">
							<img
								src="${pageContext.request.contextPath}/resources/img/sicap_logo.png">
						</div>
					</div>
				</nav>

			</div>
		</div>

		<!-- Carousel
    	================================================== -->
		<div id="myCarousel" class="carousel-inner" data-ride="carousel"
			style="margin: 0px; height: auto !important;">
			<div class="carousel-inner" role="listbox">
				<div class="item active"
					style="height:315px;background: url(${pageContext.request.contextPath}/resources/img/sicap_banner.png) no-repeat; background-size: cover">
					<div class="container">
						<div style="padding-top: 100px;" class="col-xs-8 col-xs-offset-2">
							<img class="first-slide img-responsive"
								src="${pageContext.request.contextPath}/resources/img/sicap_logo_branca.png">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row faixa6px ng-scope"
			style="background: #00BFFF; line-height: 8px; margin-left: 0px; margin-right: 0px;">&nbsp;</div>
		<div class="faixa50px text-center ng-scope">Selecione a opção
			desejada</div>
		<div class="container marketing">
			<div class="row">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<hr class="featurette-divider"
			style="margin-top: 22px; margin-bottom: -20px; border-top: 4px solid #022d68;">
		<div class="container marketing">
			<footer
				style="border: none; background-color: #FFF; text-align: center;">
				<div class="container">
					<div class="col-md-12">
						<div
							class="botoesNovo col-md-2 pull-left text-left centralServicosRodape">
							<!-- <img src="${pageContext.request.contextPath}/resources/img/sicap_rodape_central_servicos.png"  -->
							<img
								src="https://ww4.tce.ms.gov.br/portaljurisdicionado/img/econtas_rodape_central_servicos.png"
								class="img">
							<p class="ng-binding"
								style="font-size: 10px; color: blue; font-family: Tahoma;">Versão
								3.0.4.0 de 07/12/2018</p>
						</div>
						<div class="botoesNovo col-md-6 pull-left text-right">
							<a href="http://www.tce.ms.gov.br/portaljurisdicionado/"
								target="_blank"><img
								src="${pageContext.request.contextPath}/resources/img/sicap_rodape_econtas.png"
								class="img img-footer" border="0" style="padding: 5px;"></a> <a
								href="http://www.tce.ms.gov.br" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/sicap_rodape_tce.png"
								class="img img-footer" border="0" style="padding: 5px;"></a>
						</div>
						<div class="col-md-4 enderecoFooterNovo "
							style="font-size: 12px; text-align: left; border-left: 1px #ededed solid;">
							<p style="white-space: nowrap; margin: 0px;">Tribunal de
								Contas do Estado de Mato Grosso do Sul</p>
							<p style="white-space: nowrap; margin: 0px;">Endereço: Av:
								Des. José Nunes da Cunha, s/nº</p>
							<p style="white-space: nowrap; margin: 0px;">Bloco 29 - CEP
								79031-902 - Telefone: (67) 3317 1500</p>
							<p style="white-space: nowrap; margin: 0px;">Campo Grande -
								MS Brasil</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</section>
</body>
</html>