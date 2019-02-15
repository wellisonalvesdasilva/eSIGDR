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
						<h4 class="card-title">Gerenciamento de Clientes</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-2 pr-1">
									<div class="form-group">
										<label>Código</label> <input id="id" maxlength="5"
											minlength="1" value='${(fn:escapeXml(param.id))}' name="id"
											type="text" class="form-control" placeholder="Código">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Nome</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.nome))}' id="nome"
											name="nome" class="form-control" placeholder="Nome">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Email</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.email))}'
											id="email" name="email" class="form-control"
											placeholder="Nome">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>CPF</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.cpf))}' id="cpf"
											name="cpf" class="form-control" placeholder="CPF">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label>Telefone</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.telefone))}'
											id="telefone" name="telefone" class="form-control"
											placeholder="Telefone">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Telefone Recado</label> <input type="text"
											maxlength="40" minlength="1"
											value='${(fn:escapeXml(param.telefoneRecado))}'
											id="telefoneRecado" name="telefoneRecado"
											class="form-control" placeholder="Telefone Recado">
									</div>
								</div>
								<div class="col-md-1"></div>
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
										data-original-title="Cadastrar Novo Cliente" id="btnSubmit"
										href='/e-SIGDR/home/cliente/cadastrar' type="submit"
										class="btn btn-success btn-fill btn-pesquisa"> <i
										class="nc-icon nc-apple"></i> Cadastrar
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
										<th class="text-center">EMAIL</th>
										<th class="text-center">CPF</th>
										<th class="text-center">TELEFONE</th>
										<th class="text-center">TELEFONE RECADO</th>
										<th class="text-center">AÇÕES</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="it" items="${lista}" varStatus="status">
										<tr>
											<td class="text-center">${it.id}</td>
											<td>${it.nome}</td>
											<td>${it.email}</td>
											<td class="text-center">${it.cpf}</td>
											<td class="text-center">${it.telefone}</td>
											<td class="text-center">${it.telefoneRecado}</td>
											<td class="text-center"><a rel="tooltip"
												data-original-title="Editar" name="btnSubmit" id="btnSubmit"
												href='/e-SIGDR/home/cliente/editar/${it.id}' type="button"
												class="btn btn-success btn-fill"> <i
													class="nc-icon nc-settings-tool-66"></i>
											</a>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Excluir" id="btnSubmit"
													onclick="excluirCliente(${it.id})" type="button"
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
										<p>Deseja realmente excluir este Cliente?</p>
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
$(document).ready(function() {		
	
	var valor = JSON.stringify(${(fn:escapeXml(param.ativo))});
		valor ? document.getElementById("ativo").value = valor : document.getElementById("ativo").value = '';
	
		})
		
	// Abrir Modal "Excluir Funcionário"
	var codCliente = 0;
	function excluirCliente(cod) {
		$('#myModal').modal();
		codCliente = cod;
	}
	
	// Abrir Modal "Alterar Senha"
	var codClienteAlterarSenha = 0;
	function resetarSenha(cod) {
		$('#modalResetaSenha').modal();
		codClienteAlterarSenha = cod;
	}

	// Abrir tela com o Datatable carregado
	function dataTable() {
		$('#example').DataTable({
			columnDefs : [ {
				"width" : "7%",
				"targets" : 0,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "38%",
				"targets" : 1,
				className : 'mdl-data-table__cell--non-numeric'

			}, {
				"width" : "20%",
				"targets" : 2,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "10%",
				"targets" : 3,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "10%",
				"targets" : 4,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "5%",
				"targets" : 5,
				className : 'mdl-data-table__cell--non-numeric'

			},{
				"width" : "10%",
				"targets" : 6,
				className : 'mdl-data-table__cell--non-numeric'

			}, ],
		});
	};

	dataTable();


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

	
	// Evento Excluir Funcionário
	$('#btnConfirmar').click(function() {
		$('#btnConfirmar').attr('disabled', 'disabled');
		$('#btnCancelar').attr('disabled', 'disabled');
		$.ajax({
			url : 'excluir/'+codCliente,
			type : 'POST',
			contentType: "application/json"
		}).done(function(data) {
			console.log(data);
			$('#myModal').modal('hide');
			showNotification('top', 'right', 'Registro excluído com sucesso!');
			setTimeout(function() {
			location.reload();
			}, 1000);

		}).fail(function(data) {
			$('.loader').hide();
			showNotification('top', 'right', 'Erro ao excluir o registro!');
			setTimeout(function() {
			location.reload();
			}, 1000);
	$('#myModal').modal('hide');
		});
	});
	
	
</script>
</body>
</html>