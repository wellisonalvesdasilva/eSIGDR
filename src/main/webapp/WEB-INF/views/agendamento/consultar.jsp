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
						<h4 class="card-title">Lista de Pedidos à Entregar</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-1">
									<div class="form-group">
										<label>Código</label> <input id="id" maxlength="5"
											minlength="1" value='${(fn:escapeXml(param.id))}' name="id"
											type="text" class="form-control" placeholder="Código">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Data de Entrada</label> <input type="text"
											maxlength="40" minlength="1"
											value='${(fn:escapeXml(param.nome))}' id="nome" name="nome"
											class="form-control" placeholder="Data de Entrega">
									</div>
								</div>
								<div class="col-md-1">
									<div class="form-group">
										<label>Cód. Venda</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength="35"
											minlength="1" type="text" id="login" name="login"
											class="form-control" placeholder="Venda">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Status</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength="35"
											minlength="1" type="text" id="login" name="login"
											class="form-control" placeholder="Status">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Responsável</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength="35"
											minlength="1" type="text" id="login" name="login"
											class="form-control" placeholder="Login">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Pedido Gerado Por</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength="35"
											minlength="1" type="text" id="login" name="login"
											class="form-control" placeholder="Login">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6"></div>
								<div class="col-md-6 text-right">
									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" rel="tooltip" data-original-title="Pesquisar"
										class="btn btn-info btn-fill">
										<i class="nc-icon nc-zoom-split"></i> Pesquisar
									</button>
									<a name="btnLimpar" rel="tooltip"
										data-original-title="Limpar Campos" href='usuario'
										id="btnLimpar" type="submit" class="btn btn-info btn-fill">
										<i class="nc-icon nc-refresh-02"></i> Limpar
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
										<th class="text-center">ID</th>
										<th class="text-center">DATA DE ENTREGA</th>
										<th class="text-center">PEDIDO GERADO POR</th>
										<th class="text-center">NÚMERO VENDA</th>
										<th class="text-center">STATUS</th>
										<th class="text-center">RESPONSÁVEL</th>
										<th class="text-center">AÇÕES</th>
									</tr>
								</thead>
								<tbody>
									<%--<c:forEach var="it" items="${lista}" varStatus="status"> --%>
									<tr>
										<td class="text-center">25</td>
										<td class="text-center">09/01/2018</td>
										<td class="text-center">Wellison Alves da Silva</td>
										<td class="text-center">25</td>
										<td class="text-center">Pendente</td>
										<td class="text-center">-</td>
										<td class="text-center"><a rel="tooltip"
											data-original-title="Editar" name="btnSubmit" id="btnSubmit"
											href='usuario/editar/${it.id}' type="button"
											class="btn btn-default btn-fill"> <i
												class="nc-icon nc-tap-01"></i>
										</a>
											<button rel="tooltip" name="btnSubmit"
												data-original-title="Trocar Senha"
												onclick="resetarSenha(${it.id})" type="button"
												class="btn btn-success btn-fill">
												<i class="nc-icon nc-zoom-split"></i>
											</button>
											<button rel="tooltip" name="btnSubmit"
												data-original-title="Excluir" id="btnSubmit"
												onclick="excluirFuncionario(${it.id})" type="button"
												class="btn btn-danger btn-fill">
												<i class="nc-icon nc-simple-remove"></i>
											</button></td>
									</tr>
									<%--</c:forEach>--%>
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
<jsp:include page="../template/scripts-rodape.jsp" />
<script>
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
	
</script>
</body>
</html>