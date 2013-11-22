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

    function imprimirHotleads() {
        var tam = $("input[type=checkbox]:checked").length;
        var mod = tam % 10;
        if (tam > 0) {
            if (mod === 0) {
                var ids = [];
                $("input[type=checkbox]:checked").each(function() {
                    ids.push($(this).val());
                });
                //alert(ids);
                var idsData = [];
                $("input[type=checkbox]:checked").each(function() {
                    idsData.push($(this).val());
                });

                var length = idsData.length;
                //alert(length);
                for (var i = 0; i < length; i++) {
                    dataImpressao(idsData[i]);
                    //alert(idsData[i]);
                }

                var url = "<c:url value='/impresos/imprimir?ids=' />" + ids.join(",");
                window.location.href = url;
            } else {
                alert("Você precisa selecionar um número de clientes multiplos de 10 para impressão");
                return false;
            }
        } else {
            alert("Selecione algum Hot Lead");
            return false;
        }
    }

    function dataImpressao(id) {
        $.ajax({
            type: "POST",
            url: "<c:url value="/impresos/updateDatas/" />" + id,
            data: "",
            success: function(response) {
                
            }
        });
    }

</script>

<div id="list-customers">
    <h2>Clientes</h2>

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
    <a class="btn btn-primary" href="#" onclick="javascript:imprimirHotleads();"><fmt:message key="label.imprimir" /></a>
    <table class="table table-hover" id="table-clientes">
        <thead>
            <tr>
                <th></th>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.email" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.tipoCliente" /></th>
                <th><fmt:message key="campo.impres" /></th>
                <th><fmt:message key="campo.dataUltimaImpressao" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clientesHOT}" var="cliente">
                <tr id="cli${cliente.id}">
                    <td>

                        <input type="checkbox" name="${cliente.id}" value="${cliente.id}" >

                    </td>
                    <td>${cliente.id}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.tipoCliente}</td>
                    <td>

                        <c:if test="${cliente.dataUltimaImpressao ne null}">
                            <span class="glyphicon glyphicon-ok"></span>
                        </c:if>

                    </td>
                    <td>${cliente.dataUltimaImpressao}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="../template/footer.jsp" %>