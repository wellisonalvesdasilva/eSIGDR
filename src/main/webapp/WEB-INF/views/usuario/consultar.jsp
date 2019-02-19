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
						<h4 class="card-title">Gerenciamento de Usuários</h4>
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
								<div class="col-md-3">
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
								<div class="col-md-2">
									<div class="form-group">
										<label>Ativo</label> <select name="ativo" id="ativo"
											class="form-control">
											<option value="">Selecione</option>
											<option value="1">Sim</option>
											<option value="2">Não</option>
										</select>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Email</label> <input id="email" maxlength="35"
											minlength="1" value='${(fn:escapeXml(param.email))}'
											name="email" type="text" class="form-control"
											placeholder="E-mail">
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
										data-original-title="Limpar Campos" href='consultar'
										id="btnLimpar" type="submit" class="btn btn-info btn-fill">
										<i class="nc-icon nc-refresh-02"></i> Limpar
									</a> <a name="btnSubmit" rel="tooltip"
										data-original-title="Cadastrar Novo Usuário" id="btnSubmit"
										href='/e-SIGDR/home/usuario/cadastrar' type="submit"
										class="btn btn-success btn-fill"> <i
										class="nc-icon nc-single-02"></i> Novo Usuário
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
										<th onclick="ordenar(id)" class="text-center">ID</th>
										<th onclick="ordenar(nome)" class="text-center">NOME</th>
										<th onclick="ordenar(login)" class="text-center">LOGIN</th>
										<th onclick="ordenar(email)" class="text-center">EMAIL</th>
										<th onclick="ordenar(ativo)" class="text-center">ATIVO</th>
										<th class="text-center">AÇÕES</th>
									</tr>
								</thead>
								<!-- <tbody> -->

								<%-- 	<c:forEach var="it" items="${lista}" varStatus="status"> --%>
								<%-- <%-- <tr id="lista">
										<td class="text-center">1</td>
										<td class="text-center">1</td>
										<td class="text-center">1</td>
										<td class="text-center">1</td>
										<td class="text-center">1</td>
										<td class="text-center">1</td>
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
												href='/e-SIGDR/home/usuario/editar/${it.id}' type="button"
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
									
									</c:forEach> --%>

								<!-- </tbody> -->
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
			url : 'excluir/'+codFuncionario,
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
	

	function ajaxDataTable(pagina){
		var offset = 10;
		
			if(!pagina){
				pagina = 0;
			}
			
			$.ajax({
				url:'/e-SIGDR/home/usuario/listar/'+pagina,
				type:'POST',
				contentType: "application/json"
				
			}).done(function(data){
				
			
				
			if(data.lista.length > 0)
				{							
				  var t = $('#example').DataTable();
				  t.destroy();
					dataTable();
					
				  data.lista.forEach(function(valor){
						//Carrega o datatable
										t.row.add([
										valor.id,
										valor.nome,
										valor.login,
										valor.email,
										valor.ativo,
										valor.ativo										
										  ] ).draw( false );
					});		
				}
			// Quantidade Total de Registros
			var textoMostrando = "";
			var inicioContador = 0;

			var currentPage = pagina + 1;
			var numeroPaginas = data.numeroPaginas;
			
			if(pagina == 0){
				inicioContador = 1 + pagina;
			}
			
			if(pagina == 1) {
				inicioContador = offset + pagina;
			}
			
			if(pagina > 1) {
				inicioContador = pagina + "1";
			}
			
			var fimContador = pagina * offset;
			var fimContadorFormatado = fimContador + data.qtdRegistroPagina;
			textoMostrando = "Página "+ currentPage+ " de "+ numeroPaginas+ " - Mostrando de "+inicioContador*1+" até "+fimContadorFormatado + " dos "+data.qtdTotalDeRegistros + " registros encontrados."
			
			$('#example_info').html("");
			$('#example_info').html(textoMostrando);
			 
				// Paginação
				var ultimaPagina = data.numeroPaginas - 1;
				$('#example_paginate').html("");
				$('#example_paginate').append(
						'<div class="pagination"><button id="anterior" class="mdl-button previous" aria-controls="example" disabled="disabled">Anterior</button><button id="0" onclick="ajaxDataTable(0)"  class="mdl-button  mdl-button--raised mdl-button--colored" aria-controls="example">1</button><div id="menosPagina"></div><div id="botoes"></div><div id="botoes2"></div><div id="maisPagina"></div><div id="botoesAdicionais"></div><div><button id="proximo" class="mdl-button next" aria-controls="example" disabled="disabled">Próximo</button></div><button class="mdl-button" disabled="disabled" id="ultimaPagina" onclick="ajaxDataTable('+ultimaPagina+')" type="button">Último</button></div>'		
				);
				
				var i = 1;
				while (i <= data.numeroPaginas) {
			
					var paginaAtual = i + 1;
					var proximaPagina = pagina + 1;
					var paginaAnterior = pagina - 1;

					if(i > 1 && i < data.numeroPaginas){
						if(pagina >= 2 && i+1 == proximaPagina){
							$('#botoes2').append(
									'<button class="mdl-button paginaNaoInicial" type="button" id="'+i+'" onclick="ajaxDataTable('+i+')" aria-controls="example">'+paginaAtual+'</button>'		
							);
						}
					}
					if(pagina < data.numeroPaginas - 1) {
						var ajaxProximo = 'ajaxDataTable('+proximaPagina+')';
						$('#proximo').removeAttr("disabled");
						$('#proximo').attr( "onclick", ajaxProximo);
					}
			
					if(pagina >= 1) {
						var ajaxAnterior = 'ajaxDataTable('+paginaAnterior+')';
						$('#anterior').removeAttr("disabled");
						$('#anterior').attr( "onclick", ajaxAnterior);
					}
					
					
					if(i < 2){
					$('#botoes').append(
							'<button class="mdl-button paginaNaoInicial" type="button" id="'+i+'" onclick="ajaxDataTable('+i+')" aria-controls="example">'+paginaAtual+'</button>'		
					);
					}
					
					if(pagina == i){
						var idPaginaAtual = '#'+i;
						$('#0').removeClass("mdl-button--raised mdl-button--colored");
						$(idPaginaAtual).addClass("mdl-button--raised mdl-button--colored");
					} 
					
					if(pagina == 0){
						$('.paginaNaoInicial').removeClass("mdl-button--raised mdl-button--colored");
						$('#0').addClass("mdl-button--raised mdl-button--colored");
					}
					
					if(pagina != ultimaPagina){
						$('#ultimaPagina').removeAttr("disabled");
					}
										
					i++;
						
					}
				
				if(data.lista.length > 1 && pagina < ultimaPagina){
					$('#maisPagina').append(
							'<button class="mdl-button" type="button" id="continue" aria-controls="example">...</button>'		
					);
				}
				
				if(pagina > 1){
					$('#menosPagina').append(
							'<button class="mdl-button" type="button" id="voltar" aria-controls="example">...</button>'		
					);
				}
				
				});		
		
		}
			ajaxDataTable();
		
	
</script>
</body>
</html>