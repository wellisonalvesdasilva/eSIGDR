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
						<h4 class="card-title">Montar Cardápio</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" modelAttribute="obj">
							<div class="row">
								<div class="col-md-2 pr-1">
									<div class="form-group">
										<label>Data</label> <input autocomplete="off"
											placeholder="DD/MM/AAAA" id="data" name="data" type="text"
											class="form-control dataMask" placeholder="Código">
									</div>
								</div>
								<div class="col-lg-3 pl-1">
									<div class="form-group">
										<label>Categoria</label> <select id="idCategoria"
											name="idCategoria" class="form-control">
											<option value="">Selecione um valor</option>
											<c:forEach var="it" items='${listCategorias}'>
												<option value="${it.id}"
													<c:choose><c:when test="${idCategoria == it.id}">selected</c:when></c:choose>>${it.titulo}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-7 pl-1">
									<div class="form-group">
										<label>Titulo</label> <input type="text" maxlength="40"
											minlength="1" id="titulo" name="titulo" class="form-control"
											placeholder="Nome">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10">
									<div class="form-group">
										<label for="comment">Descrição:</label>
										<textarea class="form-control" id="descricao" name="descricao"
											rows="2" placeholder="Informe os Detalhes" maxlength="1000"
											name="texto"></textarea>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Valor (R$)</label> <input autocomplete="off"
											placeholder="Valor" id="valor" name="valor" type="text"
											class="form-control dataMask"
											placeholder="Informe o valor R$">
									</div>
								</div>
							</div>

							<div class="row">
								<div id="divAlimentos" class="col-lg-12">
									<label>Selecione os alimento(s):</label> <input
										id="txtAlimento" onkeyup="filtrarAlimentos()" type="text"
										placeholder="Faça uma pesquisa" class="form-control input-sm">
									<div
										style="min-height: 0px; max-height: 125px; border: 1px solid #ddd; overflow-y: scroll;">
										<c:forEach var="it" items='${alimento}'>
											<div class="alimentosToShow" name="${it.titulo}">
												<spam style='font-family:helvetica;'>
												&nbsp;&nbsp;&nbsp;<input type="checkbox" id="listAlimentos"
													name="listAlimentos" value="${it.id}" /> <span
													class="cursor-hand ng-binding">${it.titulo}</span></spam>
											</div>
										</c:forEach>
									</div>
									<div class="text-right">
										<input type="checkbox" onclick="selecionarTodosAlimentos()"
											id="selectAll" /> <span>Selecionar todos</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<a name="btnSubmit" href='/SpringMVC/cardapio/consultar'
										type="button" class="btn btn-warning btn-fill"> <i
										class="nc-icon nc-stre-left"></i> Voltar
									</a>
									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" class="btn btn-success btn-fill">
										<i class="nc-icon nc-send"></i> Salvar
									</button>
									<a name="btnSubmit" href='/SpringMVC/cardapio/montar'
										id="btnSubmit" type="submit" class="btn btn-info btn-fill">
										<i class="nc-icon nc-refresh-02"></i> Limpar
									</a>
								</div>
								<div class="col-md-7"></div>
							</div>
							<div class="clearfix"></div>
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
<script>
	function selecionarTodosAlimentos() {
		var lista = document.querySelectorAll('input[name=listAlimentos]');
		var empty = [].filter.call(lista, function(el) {
			el.checked = document.getElementById('selectAll').checked;
		});
	}

	function filtrarAlimentos() {
		var lista = document.getElementsByClassName('alimentosToShow');
		var textoParaPesquisar = document.getElementById('txtAlimento').value;

		Array.prototype.forEach.call(lista, function(el) {

			if (el.getAttribute("name").toUpperCase().includes(
					textoParaPesquisar.toUpperCase())) {
				el.style.visibility = 'visible';
				el.style.position = 'relative';
			} else {
				el.style.visibility = 'hidden';
				el.style.position = 'absolute';
			}
		});

		//var listaParaExibir = document.getElementsByName('[name^='+ textoParaPesquisar +']');
		//.style.visibility = 'visible';
	}

	// DatePicker
	$('#data').mask('00/00/0000');

	$(function() {
		$('#data').datepicker(
				{
					dateFormat : 'dd/mm/yy',
					dayNames : [ 'Domingo', 'Segunda', 'Terça', 'Quarta',
							'Quinta', 'Sexta', 'Sábado' ],
					dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D' ],
					dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
							'Sáb', 'Dom' ],
					monthNames : [ 'Janeiro', 'Fevereiro', 'Março', 'Abril',
							'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro',
							'Outubro', 'Novembro', 'Dezembro' ],
					monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai',
							'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
					nextText : 'Próximo',
					prevText : 'Anterior',
					onClose : function(dateText, inst) {
						if (!validaDat(dateText)) {
							$('#btnSubmit').prop("disabled", "disabled");
						} else {
							$('#btnSubmit').prop("disabled", "");
						}
					}
				});

	});

	function validaDat(valor) {
		var date = valor;
		var ardt = new Array;
		var ExpReg = new RegExp(
				"(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
		ardt = date.split("/");
		erro = false;
		if (date.search(ExpReg) == -1) {
			erro = true;
		} else if (((ardt[1] == 4) || (ardt[1] == 6) || (ardt[1] == 9) || (ardt[1] == 11))
				&& (ardt[0] > 30))
			erro = true;
		else if (ardt[1] == 2) {
			if ((ardt[0] > 28) && ((ardt[2] % 4) != 0))
				erro = true;
			if ((ardt[0] > 29) && ((ardt[2] % 4) == 0))
				erro = true;
		}
		if (erro) {
			return false;
		}
		return true;
	}
</script>
</body>
</html>