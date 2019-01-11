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
						<h4 class="card-title">Cadastrar Cliente</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" modelAttribute="obj"
							cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label>Nome</label> <input type="text" maxlength="40"
											minlength="1" id="nome" name="nome" class="form-control"
											placeholder="Nome">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Email</label> <input type="text" maxlength="40"
											minlength="1" id="email" name="email" class="form-control"
											placeholder="Email">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>CPF</label> <input type="text" maxlength="40"
											minlength="1" id="cpf" name="cpf" class="form-control"
											placeholder="CPF">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Telefone</label> <input type="text" maxlength="40"
											minlength="1" id="telefone" name="telefone"
											class="form-control" placeholder="Telefone">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label>Telefone Recado</label> <input type="text"
											maxlength="40" minlength="1" id="telefoneRecado"
											name="telefoneRecado" class="form-control"
											placeholder="Telefone Recado">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<a name="btnSubmit" href='/SpringMVC/cliente/consultar'
										type="button" class="btn btn-warning btn-fill"> <i
										class="nc-icon nc-stre-left"></i> Voltar
									</a>
									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" class="btn btn-success btn-fill">
										<i class="nc-icon nc-send"></i> Salvar
									</button>
									<a name="btnSubmit" href='/SpringMVC/cliente/cadastrar'
										id="btnSubmit" type="submit" class="btn btn-info btn-fill">
										<i class="nc-icon nc-refresh-02"></i> Limpar
									</a>
								</div>
								<div class="col-md-7"></div>
							</div>
						</form:form>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../template/rodape.jsp" />
</body>
<jsp:include page="../template/scripts-rodape.jsp" />
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