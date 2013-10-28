<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${not empty param.lingua}">
    <fmt:setLocale value="${param.lingua}" scope="session"/>
</c:if>
<fmt:setBundle basename="messages_es" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="/tlmkt/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/tlmkt/js/jquery.js"></script>
        <script src="/tlmkt/js/layout.js"></script>
        <title>TLMKT</title>
        <style type="text/css">
            html,
            body {
                height: 100%;
                /* The html and body elements cannot have any padding or margin. */
            }

            /* Wrapper for page content to push down footer */
            #wrap {
                min-height: 100%;
                height: auto !important;
                height: 100%;
                /* Negative indent footer by its height */
                margin: 0 auto -60px;
                /* Pad bottom by footer height */
                padding: 0 0 60px;
            }

            /* Set the fixed height of the footer here */
            #footer {
                height: 60px;
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <div id="wrap">
            <c:if test="${userSession.user ne null}">
                <div class="header">
                    <nav class="navbar navbar-default" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">Tlmkt</a>
                            <ul class="nav navbar-nav">
                                <li><a href='<c:url value="/usuario/list" />'>><fmt:message key="link.usuarios" /></a></li>
                                <li><a href='<c:url value="/cliente/list" />'><fmt:message key="link.clientes" /></a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Relatórios <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<c:url value="/report/show/lead/1" />"><fmt:message key="label.relatorio.leads" /></a></li>
                                        <li><a href="<c:url value="/report/show/potencial/1" />"><fmt:message key="label.relatorio.potencial" /></a></li>
                                        <li><a href="<c:url value="/report/show/fixo/1" />"><fmt:message key="label.relatorio.fixo" /></a></li>
                                        <li><a href="<c:url value="/report/show/semResposta/1" />"><fmt:message key="label.relatorio.semresposta" /></a></li>
                                    </ul>
                                </li>
                                <li><a href='<c:url value="/login/logout" />'><fmt:message key="link.logout" /></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </c:if>
            <div class="container">
                <div id="messages">

                </div>
