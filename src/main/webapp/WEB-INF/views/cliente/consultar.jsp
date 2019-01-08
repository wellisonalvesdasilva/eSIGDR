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
								<div class="col-md-1 pr-1">
									<div class="form-group">
										<label>Código</label> <input id="id" maxlength="5"
											minlength="1" value='${(fn:escapeXml(param.id))}' name="id"
											type="text" class="form-control" placeholder="Código">
									</div>
								</div>
								<div class="col-md-4 pl-1">
									<div class="form-group">
										<label>Nome</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.nome))}' id="nome"
											name="nome" class="form-control" placeholder="Nome">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Login</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength="35"
											minlength="1" type="text" id="login" name="login"
											class="form-control" placeholder="Login">
									</div>
								</div>
								<div class="col-md-2 pl-1">
									<div class="form-group">
										<label>Ativo</label> <select name="ativo" id="ativo"
											class="form-control">
											<option value="">Selecione</option>
											<option value="1">Sim</option>
											<option value="2">Não</option>
										</select>
									</div>
								</div>
								<div class="col-md-3 pl-1">
									<div class="form-group">
										<label>Email</label> <input id="email" maxlength="35"
											minlength="1" value='${(fn:escapeXml(param.email))}'
											name="email" type="text" class="form-control"
											placeholder="E-mail">
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-md-5">
									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" rel="tooltip" data-original-title="Pesquisar"
										class="btn btn-info btn-fill">
										<i class="nc-icon nc-zoom-split"></i> Pesquisar
									</button>
									<a name="btnLimpar" rel="tooltip"
										data-original-title="Limpar Campos" href='usuario'
										id="btnLimpar" type="submit" class="btn btn-info btn-fill">
										<i class="nc-icon nc-refresh-02"></i> Limpar
									</a> <a name="btnSubmit" rel="tooltip"
										data-original-title="Cadastrar Novo Usuário" id="btnSubmit"
										href='usuario/cadastrar' type="submit"
										class="btn btn-success btn-fill"> <i
										class="nc-icon nc-single-02"></i> Novo Usuário
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
										<th class="text-center">CÓDIGO</th>
										<th class="text-center">NOME</th>
										<th class="text-center">LOGIN</th>
										<th class="text-center">EMAIL</th>
										<th class="text-center">ATIVO</th>
										<th class="text-center">AÇÕES</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="it" items="${lista}" varStatus="status">
										<tr>
											<td class="text-center">${it.id}</td>
											<td>${it.nome}</td>
											<td class="text-center">${it.login}</td>
											<td>${it.email}</td>
											<td class="text-center"><c:choose>
													<c:when test="${it.ativo == true}">Sim</c:when>
													<c:when test="${it.ativo == false}">Não</c:when>
												</c:choose></td>
											<td class="text-center"><a rel="tooltip"
												data-original-title="Editar" name="btnSubmit" id="btnSubmit"
												href='usuario/editar/${it.id}' type="button"
												class="btn btn-success btn-fill"> <i
													class="nc-icon nc-settings-tool-66"></i>
											</a>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Trocar Senha"
													onclick="resetarSenha(${it.id})" type="button"
													class="btn btn-default btn-fill">
													<i class="nc-icon nc-refresh-02"></i>
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
						<form:form id="myModal" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Atenção</h4>
									</div>
									<div class="modal-body">
										<p>Deseja realmente excluir este funcionário?</p>
									</div>
									<div class="modal-footer">
										<button type="button" name="btnCancelar" id="btnCancelar"
											class="btn btn-default" data-dismiss="modal">Cancelar</button>
										<button name="btnConfirmar" id="btnConfirmar" type="button"
											class="btn btn-primary">Confirmar</button>
									</div>
								</div>
							</div>
							<input type="hidden" id="codAvisoExclusao"
								name="codAvisoExclusao" />
						</form:form>
						<form:form id="modalResetaSenha" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Resetar Senha</h4>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-md-12 pl-1">
												<div class="form-group">
													<label>Nova Senha</label> <input type="text" required
														id="novaSenha" name="novaSenha" maxlength="8"
														minlength="6" class="form-control"
														placeholder="Senha reset padrão: 12345678">
												</div>
											</div>
											<p class="help-block">
												<i class="nc-icon nc-bulb-63"></i> &nbsp; A senha deverá
												conter no mínimo 6 caracteres e no máximo 8.
											</p>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" name="btnCancelar"
											id="btnCancelarResetSenha" class="btn btn-default"
											data-dismiss="modal">Cancelar</button>
										<button name="btnConfirmarResetSenha"
											id="btnConfirmarResetSenha" type="button"
											class="btn btn-primary">Confirmar</button>
									</div>
								</div>
							</div>
							<input type="hidden" id="codAvisoExclusao"
								name="codAvisoExclusao" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../template/rodape.jsp" />
</body>
<script>

$(document).ready(function() {		
	
	var valor = JSON.stringify(${(fn:escapeXml(param.ativo))});
		valor ? document.getElementById("ativo").value = valor : document.getElementById("ativo").value = '';
	
		})
		
	// Abrir Modal "Excluir Funcionário"
	var codFuncionario = 0;
	function excluirFuncionario(cod) {
		$('#myModal').modal();
		codFuncionario = cod;
	}
	
	// Abrir Modal "Alterar Senha"
	var codFuncionarioAlterarSenha = 0;
	function resetarSenha(cod) {
		$('#modalResetaSenha').modal();
		codFuncionarioAlterarSenha = cod;
	}

	// Abrir tela com o Datatable carregado
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

	// Evento Alterar Senha
		$('#btnConfirmarResetSenha').click(function(){
			$('#btnConfirmarResetSenha').attr('disabled', 'disabled');
			$('#btnCancelarResetSenha').attr('disabled', 'disabled');
			var novaSenha = "0";
			if($('#novaSenha').val())
				{
					novaSenha = $('#novaSenha').val();
				}
			$.ajax({
				url:'usuario/alterarSenha/'+codFuncionarioAlterarSenha,
				type:'POST',
				contentType: "application/json",
				data: novaSenha
			}).done(function(data){
				showNotification('top', 'right', 'Senha alterada com sucesso!');
				$('#btnConfirmarResetSenha').attr('disabled', false);
				$('#btnCancelarResetSenha').attr('disabled', false);
				$('#modalResetaSenha').modal('hide');
				}).fail(function(data){
					showNotification('top', 'right', 'Erro inesperado.');							
			});		
		});			
		
	// Evento Excluir Funcionário
	$('#btnConfirmar').click(function() {
		$('#btnConfirmar').attr('disabled', 'disabled');
		$('#btnCancelar').attr('disabled', 'disabled');
		$.ajax({
			url : 'usuario/excluir/'+codFuncionario,
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