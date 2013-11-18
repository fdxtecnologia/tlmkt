<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>


<div class="row">
  <div class="col-md-6">
      <h2> Ultimos LEADS Cadastrados </h2>
      <table class="table table-hover" id="table-clientes">
        <thead>
            <tr>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.email" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.dataCadastro" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clientesLEAD}" var="cliente">
                <tr id="cli${cliente.id}">
                    <td>${cliente.id}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.dataCadastroStr}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
  </div>
  <div class="col-md-6">
      <h2> Ultimos LEADS Promovidos </h2>
      <table class="table table-hover" id="table-clientes">
        <thead>
            <tr>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.email" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.dataCadastro" /></th>
                <th><fmt:message key="campo.dataPromocao" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clientesPROMOV}" var="clientePRO">
                <tr id="cli${clientePRO.id}">
                    <td>${clientePRO.id}</td>
                    <td>${clientePRO.email}</td>
                    <td>${clientePRO.nome}</td>
                    <td>${clientePRO.dataCadastroStr}</td>
                    <td>${clientePRO.dataPromocaoStr}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
  </div>
  <div class="col-md-6">
      <h2> Ultimos LEADS impresos </h2>
      <table class="table table-hover" id="table-clientes">
        <thead>
            <tr>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.email" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.dataImpressoes" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clientesIMPRES}" var="clienteIMP">
                <tr id="cli${clienteIMP.id}">
                    <td>${clienteIMP.id}</td>
                    <td>${clienteIMP.email}</td>
                    <td>${clienteIMP.nome}</td>
                    <td>${clienteIMP.dataImpressaoStr}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
  </div>
  <div class="col-md-6">
      <h2> Ultimos acessos </h2>
      <table class="table table-hover" id="table-clientes">
        <thead>
            <tr>
                <th><fmt:message key="campo.id" /></th>
                <th><fmt:message key="campo.nome" /></th>
                <th><fmt:message key="campo.dataLogin" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userLogins}" var="userLogin">
                <tr id="cli${clienteLogin.id}">
                    <td>${userSession.user.id}</td>
                    <td>${userSession.user.nome}</td>
                    <td>${userLogin}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
  </div>
</div>
<%@include file="../template/footer.jsp" %>