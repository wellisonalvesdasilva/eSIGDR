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
						<h4 class="card-title">Gerenciamento de Alimentos</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label>Código</label> <input id="id" maxlength="5"
											minlength="1" value='${(fn:escapeXml(param.id))}' name="id"
											type="text" class="form-control" placeholder="Código">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Nome</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.titulo))}'
											id="titulo" name="titulo" class="form-control"
											placeholder="Nome">
									</div>
								</div>
								<div class="col-md-5 text-right">
									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" rel="tooltip" data-original-title="Pesquisar"
										class="btn btn-info btn-fill btn-pesquisa">
										<i class="nc-icon nc-zoom-split"></i> Pesquisar
									</button>
									<a name="btnLimpar" rel="tooltip"
										data-original-title="Limpar Campos" href='consultar'
										id="btnLimpar" type="submit"
										class="btn btn-info btn-fill btn-pesquisa"> <i
										class="nc-icon nc-refresh-02"></i> Limpar
									</a> <a name="btnSubmit" rel="tooltip"
										data-original-title="Cadastrar Novo Alimento" id="btnSubmit"
										href='/SpringMVC/alimento/cadastrar' type="submit"
										class="btn btn-success btn-fill btn-pesquisa"> <i
										class="nc-icon nc-apple"></i> Novo Alimento
									</a>
								</div>
							</div>
							<div class="clearfix"></div>
						</form:form>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table id="example" class="mdl-data-table" style="width: 100%">
								<thead>
									<tr>
										<th class="text-center">CÓDIGO</th>
										<th class="text-center">NOME</th>
										<th class="text-center">AÇÕES</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="it" items="${lista}" varStatus="status">
										<tr>
											<td class="text-center">${it.id}</td>
											<td>${it.titulo}</td>
											<td class="text-center"><a rel="tooltip"
												data-original-title="Editar" name="btnSubmit" id="btnSubmit"
												href='/SpringMVC/alimento/editar/${it.id}' type="button"
												class="btn btn-success btn-fill"> <i
													class="nc-icon nc-settings-tool-66"></i>
											</a>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Excluir" id="btnSubmit"
													onclick="excluir(${it.id})" type="button"
													class="btn btn-danger btn-fill">
													<i class="nc-icon nc-simple-remove"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<form:form id="myModal" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Atenção</h4>
									</div>
									<div class="modal-body">
										<p>Deseja realmente excluir este alimento?</p>
									</div>
									<div class="modal-footer">
										<button type="button" name="btnCancelar" id="btnCancelar"
											class="btn btn-default" data-dismiss="modal">Cancelar</button>
										<button name="btnConfirmar" id="btnConfirmar" type="button"
											class="btn btn-primary">Confirmar</button>
									</div>
								</div>
							</div>
						</form:form>
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
	// Abrir tela com o Datatable carregado
	function dataTable() {
		$('#example').DataTable({
			columnDefs : [ {
				"width" : "25%",
				"targets" : 0,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "55%",
				"targets" : 1,
				className : 'mdl-data-table__cell--non-numeric'

			}, {
				"width" : "20%",
				"targets" : 2,
				className : 'mdl-data-table__cell--non-numeric'

			}, ],
		});
	};
	dataTable();
	
	
	// Abrir Modal "Excluir Alimento"
	var codAlimento = 0;
	function excluir(cod) {
		$('#myModal').modal();
		codAlimento = cod;
	}

	// Evento Excluir 
	$('#btnConfirmar').click(function() {
		$('#btnConfirmar').attr('disabled', 'disabled');
		$('#btnCancelar').attr('disabled', 'disabled');
		$.ajax({
			url : 'excluir/' + codAlimento,
			type : 'POST',
			contentType : "application/json"
		}).done(function(data) {
			$('#myModal').modal('hide');
			showNotification('top', 'right', 'Registro excluído com sucesso!');
			setTimeout(function() {
				location.reload();
			}, 1000);

		}).fail(function(data) {
			//$('.loader').hide();
			showNotification('top', 'right', 'Erro ao excluir o registro!');
			setTimeout(function() {
				location.reload();
			}, 1000);
			$('#myModal').modal('hide');
		});
	});
	function showNotification(from, align, msg) {
		color = Math.floor((Math.random() * 5));

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
		showNotification('top', 'right', sucessoMessage);
	}
</script>
</body>
</html>