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
						<h4 class="card-title">Gerenciamento de Vendas</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-2 pr-1">
									<div class="form-group">
										<label>Data</label> <input id="id" maxlength="5" minlength="1"
											value='${(fn:escapeXml(param.id))}' name="id" type="text"
											class="form-control" placeholder="Data">
									</div>
								</div>
								<div class="col-md-4 pl-1">
									<div class="form-group">
										<label>Descrição</label> <input type="text" maxlength="40"
											minlength="1" value='${(fn:escapeXml(param.nome))}' id="nome"
											name="nome" class="form-control" placeholder="Descrição">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Titulo</label> <input
											value='${(fn:escapeXml(param.login))}' maxlength="35"
											minlength="1" type="text" id="login" name="login"
											class="form-control" placeholder="Titulo">
									</div>
								</div>
								<div class="col-md-3 pl-1">
									<div class="form-group">
										<label>Categoria</label> <select name="ativo" id="ativo"
											class="form-control">
											<option value="">Selecione</option>
											<option value="1">Sim</option>
											<option value="2">Não</option>
											<option value="2">Não</option>
										</select>
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
										data-original-title="Limpar Campos"
										href='#' id="btnLimpar" type="submit"
										class="btn btn-dafault btn-fill"> <i
										class="nc-icon nc-refresh-02"></i> Limpar
									</a> <a name="btnSubmit" rel="tooltip"
										data-original-title="Cadastrar Novo Usuário" id="btnSubmit"
										href='/e-SIGDR/home/venda/cadastrar' type="submit"
										class="btn btn-success btn-fill"> <i
										class="nc-icon nc-cart-simple"></i> Nova Venda
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
										<th class="text-center">ID</th>
										<th class="text-center">DATA</th>
										<th class="text-center">ATENDENTE</th>
										<th class="text-center">CLIENTE</th>
										<th class="text-center">GEROU PEDIDO Á ENTREGAR</th>
										<th class="text-center">AÇÕES</th>
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach var="it" items="${lista}" varStatus="status"> --%>
									<tr>
										<td class="text-center">25</td>
										<td class="text-center">10/02/2019</td>
										<td class="text-center">Wellison Alves da Silva</td>
										<td class="text-center">Josiane Gomes dos Santos</td>
										<td class="text-center">Sim</td>
										<td class="text-center"><a rel="tooltip"
											data-original-title="Editar" name="btnSubmit" id="btnSubmit"
											href='#' type="button" class="btn btn-success btn-fill">
												<i class="nc-icon nc-settings-tool-66"></i>
										</a>
											<button rel="tooltip" name="btnSubmit"
												data-original-title="Visualizar Detalhes da Venda"
												onclick="#" type="button" class="btn btn-primary btn-fill">
												<i class="nc-icon nc-zoom-split"></i>
											</button>

											<button rel="tooltip" name="btnSubmit"
												data-original-title="Acompanhar Detalhes do Pedido"
												id="btnSubmit" onclick="#" type="button"
												class="btn btn-info btn-fill">
												<i class="nc-icon nc-delivery-fast icon-bold"></i>
											</button>

											<button rel="tooltip" name="btnSubmit"
												data-original-title="Cancelar Venda" id="btnSubmit"
												onclick="#" type="button" class="btn btn-warning btn-fill">
												<i class="nc-icon nc-simple-remove"></i>
											</button></td>


										<%-- <td class="text-center">${it.id}</td>
											<td class="text-center"><fmt:formatDate
													pattern="dd/MM/yyyy" value="${it.data}" />
											<td>${it.titulo}</td>
											<td>R$ ${it.valor}0</td>
											<td class="text-center">${it.categoria.titulo}</td>
											<td class="text-center"><a rel="tooltip"
												data-original-title="Editar" name="btnSubmit" id="btnSubmit"
												href='#' type="button" class="btn btn-success btn-fill">
													<i class="nc-icon nc-settings-tool-66"></i>
											</a>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Visualizar Detalhes do Prato"
													onclick="#" type="button" class="btn btn-info btn-fill">
													<i class="nc-icon nc-zoom-split"></i>
												</button>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Visualizar Alimentos Vìnculados"
													onclick="#" type="button" class="btn btn-info btn-fill">
													<i class="nc-icon nc-apple"></i>
												</button>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Visualizar Vendas Vínculadas"
													onclick="#" type="button" class="btn btn-info btn-fill">
													<i class="nc-icon nc-cart-simple"></i>
												</button>
												<button rel="tooltip" name="btnSubmit"
													data-original-title="Excluir" id="btnSubmit" onclick="#"
													type="button" class="btn btn-danger btn-fill">
													<i class="nc-icon nc-simple-remove"></i>
												</button></td> --%>
									</tr>
									<%-- </c:forEach> --%>
								</tbody>
							</table>
						</div>
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
	var sucessoMessage = "${message}";
	if (sucessoMessage != "") {
		showNotification('top', 'right', sucessoMessage);
	}

	function dataTable() {
		$('#example').DataTable({
			columnDefs : [ {
				"width" : "20%",
				"targets" : 0,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "20%",
				"targets" : 1,
				className : 'mdl-data-table__cell--non-numeric'

			}, {
				"width" : "20%",
				"targets" : 2,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "20%",
				"targets" : 3,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "20%",
				"targets" : 4,
				className : 'mdl-data-table__cell--non-numeric'
			}, {
				"width" : "20%",
				"targets" : 5,
				className : 'mdl-data-table__cell--non-numeric'
		
		
			}, ],
		});
	};

	dataTable();
</script>
</body>
</html>