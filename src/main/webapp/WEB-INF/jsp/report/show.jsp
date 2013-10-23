<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<h1>Relatório de Clientes - ${tipo}</h1>
<button type="button" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-print"></span> Versión en PDF
</button>
<table class="table table-hover" id="table-clientes">
    <thead>
        <tr>
            <th><fmt:message key="campo.id" /></th>
            <th><fmt:message key="campo.nome" /></th>
            <th><fmt:message key="campo.email" /></th>
            <th><fmt:message key="campo.pais" /></th>
            <th><fmt:message key="campo.telefone" /></th>
            <th><fmt:message key="campo.idade" /></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${clientes}" var="cliente">
            <tr>
                <td>${cliente.id}</td>
                <td>${cliente.nome}</td>
                <td>${cliente.email}</td>
                <td>${cliente.pais}</td>
                <td>${cliente.telefone}</td>
                <td>${cliente.idade}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="paginator">
    <%--For displaying Page numbers.
    The when condition does not display a link for the current page--%>
    <%--For displaying Previous link except for the 1st page --%>
    <ul class="pagination">
        <c:if test="${page != 1}">
            <li><a href="<c:url value="/report/show/${tipo}/${page-1}" />"><fmt:message key="label.anterior" /></a></li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${page eq i}">
                    <li class="active"><a href="#">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                    <li><a href="<c:url value="/report/show/${tipo}/${i}" />">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <%--For displaying Next link --%>
            <c:if test="${page lt totalPages}">
            <li><a href="<c:url value="/report/show/${tipo}/${page + 1}" />"><fmt:message key="label.next" /></a></li>
            </c:if>
    </ul>
</div>
<%@include file="../template/footer.jsp" %>