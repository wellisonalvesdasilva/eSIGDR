<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
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

<div class="container">
	<div id="loginbox" style="margin-top: 50px;"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
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

				<form:form method="POST" modelAttribute="obj">

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							class="form-control" name="login" required id="login"
							placeholder="Login">
					</div>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input type="password"
							class="form-control" name="senha" required id="senha"
							placeholder="Senha">
					</div>
					<div class="form-group">
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
							<div class="col-md-7"></div>
							<div class="col-md-5">
								<strong>Versão 1.0.0.0 de 08/01/2019</strong>
							</div>
						</div>

					</div>
				</form:form>

			</div>
		</div>
	</div>
	<div id="signupbox" style="display: none; margin-top: 50px"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Sign Up</div>
				<div
					style="float: right; font-size: 85%; position: relative; top: -10px">
					<a id="signinlink" href="#"
						onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign
						In</a>
				</div>
			</div>
			<div class="panel-body">
				<form id="signupform" class="form-horizontal" role="form">

					<div id="signupalert" style="display: none"
						class="alert alert-danger">
						<p>Error:</p>
						<span></span>
					</div>



					<div class="form-group">
						<label for="email" class="col-md-3 control-label">Email</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="email"
								placeholder="Email Address">
						</div>
					</div>

					<div class="form-group">
						<label for="firstname" class="col-md-3 control-label">First
							Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="firstname"
								placeholder="First Name">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-md-3 control-label">Last
							Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="lastname"
								placeholder="Last Name">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-3 control-label">Password</label>
						<div class="col-md-9">
							<input type="password" class="form-control" name="passwd"
								placeholder="Password">
						</div>
					</div>

					<div class="form-group">
						<label for="icode" class="col-md-3 control-label">Invitation
							Code</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="icode"
								placeholder="">
						</div>
					</div>

					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="btn-signup" type="button" class="btn btn-info">
								<i class="icon-hand-right"></i> &nbsp Sign Up
							</button>
							<span style="margin-left: 8px;">or</span>
						</div>
					</div>

					<div style="border-top: 1px solid #999; padding-top: 20px"
						class="form-group">

						<div class="col-md-offset-3 col-md-9">
							<button id="btn-fbsignup" type="button" class="btn btn-primary">
								<i class="icon-facebook"></i>   Sign Up with Facebook
							</button>
						</div>

					</div>



				</form>
			</div>
		</div>

	</div>
</div>
</body>
<script>
	var error = "${error}";
	if (error != "") {
		showNotification('top', 'right', sucessoMessage);
	}
</script>
</html>