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
						<h4 class="card-title">Nova Venda</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" modelAttribute="obj"
							cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-2 pr-1">
									<div class="form-group">
										<label>Data</label> <input autocomplete="off"
											placeholder="DD/MM/AAAA" id="dataDaVenda" name="dataDaVenda"
											type="text" class="form-control">
									</div>
								</div>
								<div class="col-md-4 pl-1">
									<div class="form-group">
										<label>Cardápio</label>
										<div class="input-group">
											<input id="codImportacao" required name="codImportacao"
												class="form-control" placeholder="Digite a Data" type="text"
												value=""> <a class="input-group-addon" id="goSearch"
												type="button"><i class="nc-icon nc-refresh-02"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-4 pl-1">
									<div class="form-group">
										<label>Cliente</label>
										<div class="input-group">
											<input id="codImportacao" required name="codImportacao"
												class="form-control" placeholder="Digite o CPF" type="text"
												value=""> <a class="input-group-addon" id="goSearch"
												type="button"><i class="nc-icon nc-refresh-02"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-2 pl-1">
									<div class="form-group">
										<label>Quantidade</label> <input id='qtde' maxlength='35'
											minlength='qtde' value='${(fn:escapeXml(param.email))}'
											required name="email" type="text" class="form-control"
											placeholder="Quantidade">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<a name="btnSubmit" href='/e-SIGDR/home/venda/consultar'
										type="button" class="btn btn-warning btn-fill"> <i
										class="nc-icon nc-stre-left"></i> Voltar
									</a>

									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" class="btn btn-success btn-fill">
										<i class="nc-icon nc-send"></i> Salvar
									</button>

									<a name="btnSubmit" href='/e-SIGDR/home/venda/cadastrar'
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