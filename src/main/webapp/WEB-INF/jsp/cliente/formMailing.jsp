<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="container">
                <header></header>
                <h1>Nos gustaria conocerlo mejor!</h1>
                <div class="form">
                    <form action="<c:url value="/cliente/saveClienteMailing" />" method="POST">
                        <input type="hidden" name="cliente.hashEmail" value="${cliente.hashForm}" />
                        <input type="hidden" name="cliente.tipoCliente" value="POTENCIAL" />

                        <div class="form-group">
                            <label for="nome"><fmt:message key="label.nome" /></label>
                            <input type="text" class="form-control" name="cliente.nome" required value="${cliente.nome}"/>
                        </div>
                        <div class="form-group">
                            <label for="nome"><fmt:message key="label.email" /></label>
                            <input type="text" class="form-control" name="cliente.email" required value="${cliente.email}"/>
                        </div>
                        <div class="form-group">
                            <label>En relación a las finanzas, usted como se considera</label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.perfilInvestidor" value="Conservador" required>Conservador
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.perfilInvestidor" value="Moderado" required>Moderado
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.perfilInvestidor" value="Agressivo" required>Agresivo
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.perfilInvestidor" value="Muito Agressivo" required>Muy Agresivo
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Por favor indique en cuál (es) de los siguientes activos ha invertido</label>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="cliente.ativos[]" value="Plazos Fijos / Tasas de Interés fijas / Renta Fija" >Plazos Fijos / Tasas de Interés fijas / Renta Fija
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="cliente.ativos[]" value="Renta Variable como Acciones y Fondos de Inversión" >Renta Variable como Acciones y Fondos de Inversión
                                </label>
                            </div><div class="checkbox">
                                <label>
                                    <input type="checkbox" name="cliente.ativos[]" value="Monedas como dólares, euros, libras esterlinas, etc." >Monedas como dólares, euros, libras esterlinas, etc.
                                </label>
                            </div><div class="checkbox">
                                <label>
                                    <input type="checkbox" name="cliente.ativos[]" value="Otros Activos como derivados, notas estructuradas, ETFs, etc." >Otros Activos como derivados, notas estructuradas, ETFs, etc.
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>¿Cuál es su edad?</label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.idade" value="De 25 a 30 años" required>De 25 a 30 años
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.idade" value="30 a 35 años" required>30 a 35 años
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.idade" value="De 35 a 45 años" required>De 35 a 45 años
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.idade" value="Más de 45 años" required>Más de 45 años
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>¿Pensando en el horizonte de tiempo y en el objetivo de sus inversiones, ¿por cuánto tiempo aproximado piensa conservar sus inversiones?</label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.tempoInvestimento" value="De 1 a 6 meses" required>De 1 a 6 meses
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.tempoInvestimento" value="De 6 meses a 1 año" required>De 6 meses a 1 año
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.tempoInvestimento" value="De 1 a 3 años" required>De 1 a 3 años
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.tempoInvestimento" value="Más de 3 años" required>Más de 3 años
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>¿Qué porcentaje de patrimonio, excluyendo su vivienda habitual, usted estaría dispuesto a invertir?</label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.disposicao" value="Menos de un 10%" required>Menos de un 10%
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.disposicao" value="De 10% a 30%" required>De 10% a 30%
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.disposicao" value="De 30 a 50%" required>De 30 a 50%
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.disposicao" value="Más de 50%" required>Más de 50%
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>¿Cuál es la máxima pérdida que estaría dispuesto a asumir anualmente a cambio de un potencial mayor de rentabilidad a medio/largo plazo?</label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.quantiaMaxima" value="Menos de 10% de su inversión" required>Menos de 10% de su inversión
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="cliente.quantiaMaxima" value="De  10% a 30% de su inversión" required>De 10% a 30% de su inversión
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.quantiaMaxima" value="De 30 a 50%" required>De 30 a 50% de su inversión
                                </label>
                            </div><div class="radio">
                                <label>
                                    <input type="radio" name="cliente.quantiaMaxima" value="Más de 50%" required>Más de 50% de su inversión
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-danger">Enviar!</button>
                    </form>
                </div>
                <!-- /content -->
            </div> <!-- .Container -->
        </div><!-- #Wrap -->
        <div id="footer">
            <div class="container">
                <p class="text-muted credit">footer</p>
            </div>
        </div><!-- Footer -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="/tlmkt/js/bootstrap.min.js"></script>
    </body>
</html>