<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<script type="text/javascript">
//    $(document).ready(function() {
//        $("#form-cliente").submit(function(event) {
//            var data = $("#form-cliente").serialize();
//            $.ajax({
//                type: "POST",
//                url: '',
//                data: data,
//                success: function(response) {
//                    if (response === "erro") {
//                        $("#alertModalCliente").show();
//                    } else {
//                        $("#alertModalCliente").hide();
//                        $('#modalCliente').modal('hide');
//
//                        var cliente = response;
//                        var buttonEdit = "<button onclick='editCustomer(" + cliente.id + ")' type='button' class='btn btn-default'><span class='glyphicon glyphicon-edit' ></span></button>";
//                        var buttonRemove = "<button onclick='confirmRemoveCustomer(" + cliente.id + ")' type='button' class='btn btn-default'><span class='glyphicon glyphicon-remove' ></span></button>";
//
//                        var td = "<td>" + cliente.id + "</td>"
//                                + "<td>" + cliente.email + "</td>"
//                                + "<td>" + cliente.nome + "</td>"
//                                + "<td>" + cliente.tipoCliente + "</td>"
//                                + "<td>" + buttonEdit + "</td>"
//                                + "<td>" + buttonRemove + "</td>";
//                        var tr = $("<tr>").append(td);
//                        $("#table-clientes").append(tr);
//                    }
//                }
//            });
//            event.preventDefault();
//        });
//    });

    function editCustomer(id) {
        $.ajax({
            type: "POST",
            url: "<c:url value="/cliente/load/" />" + id,
            data: "",
            success: function(response) {
                var cliente = response;

                document.getElementById("id").value = cliente.id;
                document.getElementById("email").value = cliente.email;
                document.getElementById("nome").value = cliente.nome;
                document.getElementById('tipo').value = cliente.tipoCliente;

                $("#modalCliente").modal('show');
            }
        });
    }

    function confirmRemoveCustomer(id) {
        $.ajax({
            type: "POST",
            url: "<c:url value="/cliente/remove/" />" + id,
            data: "",
            success: function(response) {
                if (response === "ok") {
                    $("#cli" + id).remove();
                }
            }
        });
    }

    function enviarEmail(id) {
        $.ajax({
            type: "POST",
            url: "<c:url value='/cliente/enviarEmailCliente' />",
            data: "id=" + id,
            success: function(data) {
                if (data) {
                    var alerta = "<div class='alert alert-success'>Email enviado com Sucesso</div>";
                    $("#messages").append(alerta);
                    setTimeout(function() {
                        $(".alert").alert("close");
                    }, 4000);
                }
            }
        });
    }

    function promocaoCustomer(id) {
        $.ajax({
            type: "POST",
            url: "<c:url value="/cliente/promocao/" />" + id,
            data: "",
            success: function(response) {
                if (response === "ok") {
                    $("#cli" + id +" .checkcli").text("");
                    $("#cli" + id +" .clientetipo").text("HOT_LEAD");
                    $("#cli" + id +" .clientepromocaobutton").text("");
                }
            }
        });
    }

    function promocaoMassa() {
        var ids = [];
        $("input[type=checkbox]:checked").each(function() {
            ids.push($(this).val());
        });
        
        var length = ids.length;      
        for (var i = 0; i < length; i++) {
           promocaoCustomer(ids[i]);
            
        }
    }

</script>

<div id="list-customers">
    <h2>Clientes</h2>
    <a class="btn btn-primary" href="<c:url value="/cliente/add" />"><fmt:message key="label.adicionar" /></a>
    <br />
    <br />
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
    <table class="table table-hover" id="table-clientes">
        <thead>
            <tr>
                <th></th>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.email" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.tipoCliente" /></th>
                <th><fmt:message key="campo.dataUltimoEnvio" /></th>
                <th><fmt:message key="campo.reenviar" /></th>
                <th><fmt:message key="campo.promocao" /></th>
                    <c:if test="${userSession.user.tipo eq('ADMIN')}">
                    <th><fmt:message key="campo.editar" /></th>
                    <th><fmt:message key="campo.excluir" /></th>
                    </c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clientes}" var="cliente">
                <tr id="cli${cliente.id}">
                    <td class="checkcli">
                        <c:if test="${cliente.tipoCliente eq('LEAD')}" >
                        <input type="checkbox" name="${cliente.id}" value="${cliente.id}" >
                        </c:if>
                    </td>
                    <td class="clienteid">${cliente.id}</td>
                    <td class="clienteemail">${cliente.email}</td>
                    <td class="clientenome">${cliente.nome}</td>
                    <td class="clientetipo">${cliente.tipoCliente}</td>
                    <td class="clientedataenvio">${cliente.dataEnvioEmail}</td>

                    <td class="clienteenviabutton">
                        <c:if test="${cliente.tipoCliente eq('LEAD')}" >
                            <button onclick='enviarEmail(${cliente.id});' type='button' class='btn btn-default'><span class='glyphicon glyphicon-send' ></span></button>
                            </c:if>
                    </td>

                    <td class="clientepromocaobutton">
                        <c:if test="${cliente.tipoCliente eq('LEAD')}" >

                            <button onclick='promocaoCustomer(${cliente.id});' type='button' class='btn btn-default'><span class='glyphicon glyphicon-chevron-up' ></span></button>
                            </c:if>
                    </td>

                    <c:if test="${userSession.user.tipo eq('ADMIN')}">
                        <td class="clienteeditbutton"><a class='btn btn-default' href="<c:url value="/cliente/edit"/>/${cliente.id}"><span class='glyphicon glyphicon-edit' ></span></a></td>
                        <td class="clientedeletebutton"><button onclick='confirmRemoveCustomer(${cliente.id});' type='button' class='btn btn-default'><span class='glyphicon glyphicon-remove' ></span></button></td>
                            </c:if>
                </tr>
            </c:forEach>
            <tr>
                <td><a class="btn btn-primary" href="<c:url value="/cliente/list" />" onclick="javascript:promocaoMassa();"><fmt:message key="campo.promocao" /></a></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>

                </td>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>

<div class="modal fade" id="modalCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><fmt:message key="title.modal.cliente" /></h4>
            </div>
            <form role="form" id="form-cliente">
                <div class="modal-body">
                    <input type="hidden" id="id" name="cliente.id" value="${clienteLoaded.id}" />
                    <div class="form-group">
                        <label for="email"><fmt:message key="campo.email" /></label>
                        <input type="email" class="form-control" id="email" name="cliente.email" value="${clienteLoaded.email}" placeholder="<fmt:message key="placeholder.email" />" required />
                    </div>
                    <div class="form-group">
                        <label for="nome"><fmt:message key="campo.nome" /></label>
                        <input type="text" class="form-control" id="nome" name="cliente.nome" value="${clienteLoaded.nome}" placeholder="<fmt:message key="placeholder.nome" />" required />
                    </div>
                    <div class="alert alert-warning fade in" id="alertModalCliente" hidden>
                        <button type="button" class="close" onclick="$('#alertModalCliente').hide()">&times;</button>
                        <strong><fmt:message key="erro.cliente.title" /></strong> <fmt:message key="erro.cliente.message" />
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