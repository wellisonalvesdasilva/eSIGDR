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

<jsp:include page="../template/cabecalho.jsp" />
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card strpied-tabled-with-hover">
					<div class="card-header ">
						<h4 class="card-title">Cadastrar Usuário</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" modelAttribute="obj"
							cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Nome</label> <input type="text" maxlength='40'
											minlength='20' required id="nome" name="nome"
											class="form-control" placeholder="Nome">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Login</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength='20'
											minlength='20' type="text" id="login" required name="login"
											class="form-control" placeholder="Login">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Senha</label> <input type="password" maxlength='8'
											minlength='6' id="senha" required name="senha"
											class="form-control" placeholder="Senha">
									</div>
								</div>
								<div class="col-md-2 pl-1">
									<div class="form-group">
										<label>Ativo</label> <select name="ativo" required id="ativo"
											class="form-control">
											<option value="">Selecione</option>
											<option value="1">Sim</option>
											<option value="0">Não</option>
										</select>
									</div>
								</div>
								<div class="col-md-2 pl-1">
									<div class="form-group">
										<label>Email</label> <input id="email" maxlength='35'
											minlength='20' value='${(fn:escapeXml(param.email))}'
											required name="email" type="text" class="form-control"
											placeholder="E-mail">
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-md-5">
									<a name="btnSubmit" href='/SpringMVC/usuario' type="button"
										class="btn btn-warning btn-fill"> <i
										class="nc-icon nc-stre-left"></i> Voltar
									</a>

									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" class="btn btn-success btn-fill">
										<i class="nc-icon nc-send"></i> Salvar
									</button>

									<a name="btnSubmit" href='/SpringMVC/usuario/cadastrar'
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
<jsp:include page="../template/rodape.jsp" />
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
		showNotification('top', 'right', 'Registro cadastrado com sucesso!');
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