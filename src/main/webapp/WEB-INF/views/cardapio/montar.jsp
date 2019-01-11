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
								<div class="col-md-2">
									<div class="form-group">
										<label>Data</label> <input autocomplete="off"
											placeholder="DD/MM/AAAA" id="data" name="data" type="text"
											class="form-control dataMask" placeholder="Código">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Valor (R$)</label> <input autocomplete="off"
											placeholder="Valor" id="valor" name="valor" type="text"
											class="form-control dataMask"
											placeholder="Informe o valor R$">
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<label>Titulo</label> <input type="text" maxlength="40"
											minlength="1" id="titulo" name="titulo" class="form-control"
											placeholder="Titulo">
									</div>
								</div>
							</div>
							<div class="row">
								<div id="divAlimentos" class="col-lg-4">
									<label>Selecione os Alimentos Básicos</label> <input
										id="txtAlimento" onkeyup="filtrarAlimentos(1)" type="text"
										placeholder="Pesquise" class="form-control input-sm">
									<div
										style="min-height: 0px; max-height: 125px; border: 1px solid #ddd; overflow-y: scroll;">
										<c:forEach var="it" items='${alimento.basicos}'>
											<div class="alimentosToShow" name="${it.titulo}">
												<spam style='font-family:helvetica;'>
												&nbsp;&nbsp;&nbsp;<input type="checkbox" id="listAlimentos"
													name="listAlimentos" value="${it.id}" /> <span
													class="cursor-hand ng-binding">${it.titulo}</span></spam>
											</div>
										</c:forEach>
									</div>
									<div class="text-right">
										<input type="checkbox" onclick="selecionarTodosAlimentos(1)"
											id="selectAllAlimentos" /> <span>Todos</span>
									</div>
								</div>
								<div id="divAlimentos" class="col-lg-4">
									<label>Selecione as Carnes</label> <input id="txtCarne"
										onkeyup="filtrarAlimentos(2)" type="text"
										placeholder="Pesquise" class="form-control input-sm">
									<div
										style="min-height: 0px; max-height: 125px; border: 1px solid #ddd; overflow-y: scroll;">
										<c:forEach var="it" items='${alimento.carnes}'>
											<div class="carnesToShow" name="${it.titulo}">
												<spam style='font-family:helvetica;'>
												&nbsp;&nbsp;&nbsp;<input type="checkbox" id="listCarnes"
													name="listCarnes" value="${it.id}" /> <span
													class="cursor-hand ng-binding">${it.titulo}</span></spam>
											</div>
										</c:forEach>
									</div>
									<div class="text-right">
										<input type="checkbox" onclick="selecionarTodosAlimentos(2)"
											id="selectAllCarnes" /> <span>Todos</span>
									</div>
								</div>
								<div id="divAlimentos" class="col-lg-4">
									<label>Selecione as Saladas</label> <input id="txtSalada"
										onkeyup="filtrarAlimentos(3)" type="text"
										placeholder="Pesquise" class="form-control input-sm">
									<div
										style="min-height: 0px; max-height: 125px; border: 1px solid #ddd; overflow-y: scroll;">
										<c:forEach var="it" items='${alimento.verduras}'>
											<div class="saladasToShow" name="${it.titulo}">
												<spam style='font-family:helvetica;'>
												&nbsp;&nbsp;&nbsp;<input type="checkbox" id="listSaladas"
													name="listSaladas" value="${it.id}" /> <span
													class="cursor-hand ng-binding">${it.titulo}</span></spam>
											</div>
										</c:forEach>
									</div>
									<div class="text-right">
										<input type="checkbox" onclick="selecionarTodosAlimentos(3)"
											id="selectAllSaladas" /> <span>Todos</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Descrição</label>
										<textarea rows="4" maxlength="40" minlength="1" id="descricao"
											name="descricao" class="form-control"
											placeholder="Descrição do cardápio" cols="50"></textarea>
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
	var idLista = '';
	var idTextoParaPesquisar = '';

	function filtrarAlimentos(param) {

		if (param == 1) {
			idLista = 'alimentosToShow';
			idTextoParaPesquisar = 'txtAlimento';
		}
		if (param == 2) {
			idLista = 'carnesToShow';
			idTextoParaPesquisar = 'txtCarne';
		}
		if (param == 3) {
			idLista = 'saladasToShow';
			idTextoParaPesquisar = 'txtSalada'
		}

		var lista = document.getElementsByClassName(idLista);
		var textoParaPesquisar = document.getElementById(idTextoParaPesquisar).value;

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
	}

	var tipo = '';
	var checkedById = '';
	function selecionarTodosAlimentos(param) {

		if (param == 1) {
			tipo = 'listAlimentos';
			checkedById = 'selectAllAlimentos';
		}
		if (param == 2) {
			tipo = 'listCarnes';
			checkedById = 'selectAllCarnes';
		}
		if (param == 3) {
			tipo = 'listSaladas';
			checkedById = 'selectAllSaladas'
		}

		var lista = document.querySelectorAll('input[name=' + tipo + ']');
		var empty = [].filter.call(lista, function(el) {
			el.checked = document.getElementById(checkedById).checked;
		});
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
</script>
</body>
</html>