<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<script type="text/javascript">

    $(document).ready(function() {
        $("#form-busca").submit(function(event) {
            $.ajax({
                type: "POST",
                url: '<c:url value="/usuario/buscar" />',
                data: "busca=" + $("#form-busca input").val(),
                success: function(response) {
                    $("#form-busca #btn-busca").button('reset');
                    if (response.length > 0) {
                        $("#table-usuarios tbody").empty();
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
                            $("#table-usuarios tbody").append(tr);
                        }
                    }
                }
            });
            return false;
        });
    });
</script>
<c:if test="${success}">
    <div class="alert alert-success alert-dismissable">
        <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
        <fmt:message key="mensagem.usuario.sucesso" />
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            setTimeout(function() {
                $(".alert").alert("close");
            }, 4000);
        });
    </script>
</c:if>
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
                    <td><a class='btn btn-default' href="<c:url value="/usuario/edit"/>/${usuario.id}"><span class='glyphicon glyphicon-edit' ></span></a></td>
                    <td><a class='btn btn-default' href="#"><span class='glyphicon glyphicon-remove' ></span></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<a class="btn btn-primary" href="<c:url value="/usuario/add" />"><fmt:message key="label.adicionar" /></a>

<%@include file="../template/footer.jsp" %>