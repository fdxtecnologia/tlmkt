<%-- 
    Document   : imprimir
    Created on : 19/11/2013, 11:57:43
    Author     : Luciano Pucci
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imprimir Hot Leads</title>
    </head>

    <body>
        <table id="Table_01" width="1000" border="0" cellpadding="0" cellspacing="0" >

            <c:forEach items="${clientesHotImprimir}" var="cliente" varStatus="cont">
                <c:if test="${cont.count-1 % 2 == 0}">

                    <tr>

                    </c:if>
                    <td width="1168" height="290" align="center" style="font-size: 14px">
                        <h2>${cliente.id} - ${cliente.nome}</h2><br />
                        ${cliente.email}<br />
                        ${cliente.cidade}<br />
                        ${cliente.telefone}<br />
                        ${cliente.celular} <br />
                    </td>
                    <c:if test="${cont.count % 2 == 0}">    
                    </tr>
                </c:if> 
            </c:forEach> 
        </table>
    </body>
</html>
