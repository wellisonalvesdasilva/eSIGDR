<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>[e-SIGDR] Sistema Informatizado Gerenciador de
	Restaurantes</title>

<link
	href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/login/jquery-1.11.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/core/popper.min.js"
	type="text/javascript"></script>
</head>

<body>
	<div class="login-container">

		<div id="loginbox" style="margin-top: 50px;"
			class="col-lg-5 col-lg-offset-4 col-xs-6  col-xs-offset-2 col-sm-6  col-sm-offset-2 col-md-6  col-md-offset-2">
			<h2 class="text-center">[e-SIGDR] Sistema Informatizado
				Gerenciador de Restaurantes</h2>
			<br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Formulário de Autenticação</div>

				</div>
				<div style="padding-top: 30px" class="panel-body">
					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>
					<form action="${loginUrl}" method="post" class="form-horizontal">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<p>Usuário e/ou senha inválido(s)!</p>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">
								<p>Usuário desconectado com sucesso!</p>
							</div>
						</c:if>
						<div class="input-group input-sm">
							<label class="input-group-addon" for="username"><i
								class="glyphicon glyphicon-user"></i></label> <input type="text"
								class="form-control" id="username" name="ssoId"
								placeholder="Usuário" required>
						</div>
						<div class="input-group input-sm">
							<label class="input-group-addon" for="password"><i
								class="glyphicon glyphicon-lock"></i></label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="Senha" required>
						</div>
						<div class="input-group input-sm">
							<div class="checkbox">
								<label><input type="checkbox" id="rememberme"
									name="remember-me"> Lembrar</label>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="form-actions">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" class="btn btn-primary btn-fill">
										<i class="nc-icon nc-send"></i> Autenticar
									</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 control">
									<div class="text-right">
										<strong>Versão 1.0.0.0 de 22/01/2019</strong>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>