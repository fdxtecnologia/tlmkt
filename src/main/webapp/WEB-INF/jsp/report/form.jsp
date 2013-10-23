<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="form" id="form-usuario" action="<c:url value="/usuario/save" />" method="POST">
    <input type="hidden" name="usuario.id" value="${usuario.id}"/>
    <div class="form-group">
        <label for="nome"><fmt:message key="campo.nome" /></label>
        <input type="text" class="form-control" id="nome" name="usuario.nome" placeholder="<fmt:message key="placeholder.nome" />" required value="${usuario.nome}" />
    </div>
    <div class="form-group">
        <label for="login"><fmt:message key="campo.login" /></label>
        <input type="text" class="form-control" id="login" name="usuario.login" placeholder="<fmt:message key="placeholder.email" />" required value="${usuario.login}" />
    </div>
    <c:if test="${usuario.id eq null}">
        <div class="form-group">
            <label for="senha"><fmt:message key="campo.senha" /></label>
            <input type="password" class="form-control" id="senha" name="usuario.senha" placeholder="<fmt:message key="placeholder.senha" />" required />
        </div>
        <div class="form-group">
            <label for="confirmarsenha"><fmt:message key="campo.confirmarsenha" /></label>
            <input type="password" class="form-control" id="confirmarsenha" placeholder="<fmt:message key="placeholder.senha" />" required validationMessage />
        </div>
    </c:if>
    <div class="form-group">
        <label for="tipo"><fmt:message key="campo.tipo" /></label>
        <select class="form-control" name="usuario.tipo">
            <option value="USUARIO" <c:if test="${usuario.tipo eq 'USUARIO'}"> selected="selected"</c:if>><fmt:message key='input.tipousuario.usuario' /></option>
            <option value="ADMIN"   <c:if test="${usuario.tipo eq 'ADMIN'}"> selected="selected"</c:if>><fmt:message key='input.tipousuario.admin' /></option>
            </select>
        </div>
        <a type="button" class="btn btn-default" href="<c:url value="/usuario/list" />"><fmt:message key="action.voltar" /></a>
        <button type='submit' class="btn btn-primary" data-loading-text="<fmt:message key="label.salvando" />" ><fmt:message key="action.salvar" /></button>
</form>
