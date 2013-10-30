<%-- 
    Document   : form
    Created on : Oct 29, 2013, 1:32:10 PM
    Author     : guilherme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form">
    <form action="<c:url value='/cliente/save'/>" method="POST">
        <input type="hidden" name="cliente.hashEmail" value="${cliente.hashForm}" />
        <input type="text" name="cliente.id" value="${cliente.id}" hidden/>
        <div class="form-group">
            <label for="nome"><fmt:message key="label.nome" /></label>
            <input type="text" class="form-control" name="cliente.nome" required value="${cliente.nome}"/>
        </div>
        <div class="form-group">
            <label for="nome"><fmt:message key="label.email" /></label>
            <input type="text" class="form-control" name="cliente.email" required value="${cliente.email}"/>
        </div>
        <div class="form-group">
            <label for="tipo"><fmt:message key="campo.tipoCliente" /></label>
            <select class="form-control" id="tipo" name="cliente.tipoCliente">
                <option value="LEAD" <c:if test="${cliente.tipoCliente eq 'LEAD'}"> selected="selected"</c:if>><fmt:message key='input.tipocliente.lead' /></option>
                <option value="POTENCIAL" <c:if test="${cliente.tipoCliente eq 'POTENCIAL'}"> selected="selected"</c:if>><fmt:message key='input.tipocliente.potencial' /></option>
                <option value="FIXO" <c:if test="${cliente.tipoCliente eq 'FIXO'}"> selected="selected"</c:if>><fmt:message key='input.tipocliente.fixo' /></option>
                </select>
            </div>
            <div class="form-group">
                <label for="pais"><fmt:message key="label.pais" /></label>
            <input type="text" class="form-control" name="cliente.pais" required value="${cliente.pais}"/>
        </div>
        <div class="form-group">
            <label for="telefone"><fmt:message key="label.telefone" /></label>
            <input type="text" class="form-control" name="cliente.telefone" required value="${cliente.telefone}"/>
        </div>
        <div class="form-group">
            <label for="telefone2"><fmt:message key="label.telefone2" /></label>
            <input type="text" class="form-control" name="cliente.telefone2" value="${cliente.telefone2}"/>
        </div>
        <div class="form-group">
            <label for="informacoesAdicionais"><fmt:message key="label.informacoesAdicionais" /></label>
            <textarea class="form-control" rows="3" name="cliente.informacoesAdicionais">${cliente.informacoesAdicionais}</textarea>
        </div>
        <div class="form-group">
            <label>Perfil:</label>
            <div class="radio">
                <label>
                    <input type="radio" name="cliente.perfilInvestidor" value="Conservador" required <c:if test="${cliente.perfilInvestidor eq 'Conservador'}"> checked</c:if>>Conservador
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.perfilInvestidor" value="Moderado" required <c:if test="${cliente.perfilInvestidor eq 'Moderado'}"> checked</c:if>>Moderado
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.perfilInvestidor" value="Agressivo" required <c:if test="${cliente.perfilInvestidor eq 'Agressivo'}"> checked</c:if>>Agresivo
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.perfilInvestidor" value="Muy Agresivo" required <c:if test="${cliente.perfilInvestidor eq 'Muy Agressivo'}"> checked</c:if>>Muy Agresivo
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>Activos invertidos: </label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cliente.listaAtivos[]" value="Plazos Fijos / Tasas de Interés fijas / Renta Fija"
                        <c:if test="${cliente.opcaoAtivo1}">checked</c:if>
                        >Plazos Fijos / Tasas de Interés fijas / Renta Fija
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cliente.listaAtivos[]" value="Renta Variable como Acciones y Fondos de Inversión"
                        <c:if test="${cliente.opcaoAtivo2}">checked</c:if>       
                        >Renta Variable como Acciones y Fondos de Inversión
                    </label>
                </div><div class="checkbox">
                    <label>
                        <input type="checkbox" name="cliente.listaAtivos[]" value="Monedas como dólares, euros, libras esterlinas, etc."
                        <c:if test="${cliente.opcaoAtivo3}">checked</c:if>
                        >Monedas como dólares, euros, libras esterlinas, etc.
                    </label>
                </div><div class="checkbox">
                    <label>
                        <input type="checkbox" name="cliente.listaAtivos[]" value="Otros Activos como derivados, notas estructuradas, ETFs, etc."
                        <c:if test="${cliente.opcaoAtivo4}">checked</c:if>
                        >Otros Activos como derivados, notas estructuradas, ETFs, etc.
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>Edad: </label>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.idade" value="De 25 a 30 años" required <c:if test="${cliente.idade eq 'De 25 a 30 años'}"> checked</c:if>>De 25 a 30 años
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.idade" value="De 30 a 35 años" required <c:if test="${cliente.idade eq 'De 30 a 35 años'}"> checked</c:if>>De 30 a 35 años
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.idade" value="De 35 a 45 años" required <c:if test="${cliente.idade eq 'De 35 a 45 años'}"> checked</c:if>>De 35 a 45 años
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.idade" value="Más de 45 años" required <c:if test="${cliente.idade eq 'Más de 45 años'}"> checked</c:if>>Más de 45 años
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>Tiempo de sus inversiones:</label>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.tempoInvestimento" value="De 1 a 6 meses" required <c:if test="${cliente.tempoInvestimento eq 'De 1 a 6 meses'}"> checked</c:if>>De 1 a 6 meses
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.tempoInvestimento" value="De 6 meses a 1 año" required <c:if test="${cliente.tempoInvestimento eq 'De 6 meses a 1 año'}"> checked</c:if>>De 6 meses a 1 año
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.tempoInvestimento" value="De 1 a 3 años" required <c:if test="${cliente.tempoInvestimento eq 'De 1 a 3 años'}"> checked</c:if>>De 1 a 3 años
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.tempoInvestimento" value="Más de 3 años" required <c:if test="${cliente.tempoInvestimento eq 'Más de 3 años'}"> checked</c:if>>Más de 3 años
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>¿Qué porcentaje de patrimonio estaría dispuesto a invertir?</label>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.disposicao" value="Menos de un 10%" required <c:if test="${cliente.disposicao eq 'Menos de un 10%'}"> checked</c:if>>Menos de un 10%
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.disposicao" value="De 10% a 30%" required <c:if test="${cliente.disposicao eq 'De 10% a 30%'}"> checked</c:if>>De 10% a 30%
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.disposicao" value="De 30 a 50%" required <c:if test="${cliente.disposicao eq 'De 30 a 50%'}"> checked</c:if>>De 30 a 50%
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.disposicao" value="Más de 50%" required <c:if test="${cliente.disposicao eq 'Más de 50%'}"> checked</c:if>>Más de 50%
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>¿Cuál es la máxima pérdida?</label>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.quantiaMaxima" value="Menos de 10% de su inversión" required <c:if test="${cliente.quantiaMaxima eq 'Menos de 10% de su inversión'}"> checked</c:if>>Menos de 10% de su inversión
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="cliente.quantiaMaxima" value="De  10% a 30% de su inversión" required <c:if test="${cliente.quantiaMaxima eq 'De  10% a 30% de su inversión'}"> checked</c:if>>De 10% a 30% de su inversión
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.quantiaMaxima" value="De 30 a 50%" required <c:if test="${cliente.quantiaMaxima eq 'De 30 a 50%'}"> checked</c:if>>De 30 a 50% de su inversión
                    </label>
                </div><div class="radio">
                    <label>
                        <input type="radio" name="cliente.quantiaMaxima" value="Más de 50%" required <c:if test="${cliente.quantiaMaxima eq 'Más de 50%'}"> checked</c:if>>Más de 50% de su inversión
                </label>
            </div>
        </div>
        <button type="submit" class="btn btn-danger">Enviar!</button>
    </form>
</div>
