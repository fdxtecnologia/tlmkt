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
            <div class="header">
                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="<c:url value='/login/' />">Tlmkt</a>
                        <ul class="nav navbar-nav">
                            <c:if test="${userSession.user ne null}">
                                <li><a href='<c:url value="/cliente/list" />'>Clientes</a></li>
                                <c:if test="${userSession.user.tipo eq 'ADMIN'}"><li><a href='<c:url value="/usuario/list" />'>Usuários</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Relatórios <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<c:url value="/report/show/lead/1" />">Relatório de Leads</a></li>
                                            <li><a href="<c:url value="/report/show/potencial/1" />">Relatório de Clientes em Potencial</a></li>
                                            <li><a href="<c:url value="/report/show/fixo/1" />">Relatório de Clientes Fixos</a></li>
                                            <li><a href="<c:url value="/report/show/semResposta/1" />">Clientes que não responderam nos ultimos 3 dias</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <li><a href='<c:url value="/login/logout" />'>Logout</a></li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="container">
                <div id="messages">

                </div>
