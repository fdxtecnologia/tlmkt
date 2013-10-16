<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<script type="text/javascript">

    $(document).ready(function() {
        $("#form-usuario").submit(function(event) {
            if ($("#senha").val() == $("#confirmarsenha").val()) {
                $("#senha,#confirmarsenha").css("border", "1px solid #ccc");
                $("#form-busca #btn-busca").button('loading');
                $.ajax({
                    type: "POST",
                    url: "/tlmkt/usuario/busca",
                    data: "query=",
                    success: function(response) {
                        $("#form-busca #btn-busca").button('reset');
                        if (response.length > 0) {
                            for (var i in response) {
                                var user = response[i];
                                //id|nome|login|editar|excluir
                                var buttonEdit = "<button onclick='editUser(" + user.id + ")' type='button' class='btn btn-default'><span class='glyphicon glyphicon-edit' ></span></button>";
                                var buttonRemove = "<button onclick='confirmRemoveUser(" + user.id + ")' type='button' class='btn btn-default'><span class='glyphicon glyphicon-remove' ></span></button>";

                                var td = "<td>" + user.id + "</td>"
                                        + "<td>" + user.nome + "</td>"
                                        + "<td>" + user.login + "</td>"
                                        + "<td>" + buttonEdit + "</td>"
                                        + "<td>" + buttonRemove + "</td>";
                                var tr = $("<tr>").append(td);
                                $("#table-usuarios").append(tr);
                            }
                        }
                    }
                });
            } else {
                $("#senha,#confirmarsenha").css("border", "1px solid #f00");
                $("#confirmarsenha").focus();
            }
            return false;
        });

    });
</script>





<div id="list-user">
    <h2>Usuarios</h2>
    <div class='panel panel-busca panel-default'>
        <div class="panel-body">
            <form class="form-horizontal" ID="form-busca">
                <div class="input-group">
                    <input type="text" class="form-control" id="busca" required placeholder="<fmt:message key='placeholder.busca' />"/>
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" id="btn-busca" data-loading-text="Buscando"><fmt:message key='label.buscar' /></button>
                    </span>
                </div><!-- /input-group -->
            </form>
        </div>
    </div>
    <table class="table table-hover" id="table-usuarios">
        <thead>
            <tr>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.login" /></th>
                <th><fmt:message key="campo.editar" /></th>
                <th><fmt:message key="campo.excluir" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lista}" var="usuario">
                <tr>
                    <td>${usuario.id}</td>
                    <td>${usuario.nome}</td>
                    <td>${usuario.login}</td>
                    <td><button onclick='editUser(${usuario.id});' type='button' class='btn btn-default'><span class='glyphicon glyphicon-edit' ></span></button></td>
                    <td><button onclick='confirmRemoveUser(${usuario.id});' type='button' class='btn btn-default'><span class='glyphicon glyphicon-remove' ></span></button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<a class="btn btn-primary" data-toggle="modal" href="#modalUsuario" onClick="$('#modalUsuario input').val('');
        return true;"><fmt:message key="label.adicionar" /></a>

<div class="modal fade" id="modalUsuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><fmt:message key="title.modal.usuario" /></h4>
            </div>
            <form role="form" id="form-usuario">
                <div class="modal-body">
                    <input type="hidden" name="usuario.id" />
                    <div class="form-group">
                        <label for="nome"><fmt:message key="campo.nome" /></label>
                        <input type="text" class="form-control" id="nome" name="usuario.nome" placeholder="<fmt:message key="placeholder.nome" />" required />
                    </div>
                    <div class="form-group">
                        <label for="login"><fmt:message key="campo.login" /></label>
                        <input type="text" class="form-control" id="login" name="usuario.login" placeholder="<fmt:message key="placeholder.email" />" required />
                    </div>
                    <div class="form-group">
                        <label for="senha"><fmt:message key="campo.senha" /></label>
                        <input type="password" class="form-control" id="senha" name="usuario.senha" placeholder="<fmt:message key="placeholder.senha" />" required />
                    </div>
                    <div class="form-group">
                        <label for="confirmarsenha"><fmt:message key="campo.confirmarsenha" /></label>
                        <input type="password" class="form-control" id="confirmarsenha" placeholder="<fmt:message key="placeholder.senha" />" required validationMessage />
                    </div>
                    <div class="form-group">
                        <label for="tipo"><fmt:message key="campo.tipo" /></label>
                        <select class="form-control" name="usuario.tipo">
                            <option value="USUARIO"><fmt:message key='input.tipousuario.usuario' /></option>
                            <option value="ADMIN"><fmt:message key='input.tipousuario.admin' /></option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="action.fechar" /></button>
                    <button type='submit' class="btn btn-primary" data-loading-text="<fmt:message key="label.salvando" />" ><fmt:message key="action.salvar" /></button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="../template/footer.jsp" %>