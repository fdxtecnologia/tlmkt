<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<style type="text/css">
    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }
    .form-signin .checkbox {
        font-weight: normal;
    }
    .form-signin .form-control {
        position: relative;
        font-size: 16px;
        height: auto;
        padding: 10px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="text"] {
        margin-bottom: -1px;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
</style>

<form class="form-signin" method="POST" action="<c:url value='/login/doLogin' />">
    <h2 class="form-signin-heading"><img src="<c:url value='/images/ecofin_logo@300x.png' />" /></h2>
    <c:if test="${message}">
        <div class="alert alert-danger">
            <fmt:message key="erro.login"></fmt:message>
            </div>
    </c:if>
    <input type="text" class="form-control" placeholder="Login" name="login" autofocus required>
    <input type="password" class="form-control" placeholder="Contraseña" name="senha" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
</form>
<%@include file="../template/footer.jsp" %>