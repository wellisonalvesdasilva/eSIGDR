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
						<h4 class="card-title">Editar Usuário</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" modelAttribute="obj"
							cssClass='form-horizontal'>
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label>Nome</label> <input type="text" maxlength='40'
											minlength='1' value='${obj.nome}' required id="nome"
											name="nome" class="form-control" placeholder="Nome">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Login</label> <input maxlength='20' minlength='1'
											value='${obj.login}' type="text" id="login" required
											name="login" class="form-control" placeholder="Login">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Ativo</label> <select name="ativo" required id="ativo"
											class="form-control">
											<option value="">Selecione</option>
											<option value="true">Sim</option>
											<option value="false">Não</option>
										</select>
									</div>
								</div>
								<input type="hidden" value='${obj.id}' name="id" /> <input
									type="hidden" value='${obj.senha}' name="senha" />
								<div class="col-md-3">
									<div class="form-group">
										<label>Email</label> <input id="email" maxlength='35'
											minlength='1' value='${obj.email}' required name="email"
											type="text" class="form-control" placeholder="E-mail">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<a name="btnSubmit" href='/e-SIGDR/home/usuario/consultar'
										type="button" class="btn btn-warning btn-fill"> <i
										class="nc-icon nc-stre-left"></i> Voltar
									</a>

									<button name="btnSubmit" type="submit" id="btnSubmit"
										type="button" class="btn btn-success btn-fill">
										<i class="nc-icon nc-send"></i> Salvar
									</button>

									<a name="btnSubmit" href='/e-SIGDR/home/usuario/cadastrar'
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
		showNotification('top', 'right', 'Registro editado com sucesso!');
	}


	$(document).ready(function() {		
		
		var valor = JSON.stringify(${obj.ativo});
			valor ? document.getElementById("ativo").value = valor : document.getElementById("ativo").value = '';
		
			})
			
</script>
</body>
</html>