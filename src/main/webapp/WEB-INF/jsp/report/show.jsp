<%-- 
    Document   : login
    Created on : 15/10/2013, 15:08:18
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<script>
    
    $(document).ready(function(){

     $('#table-clientes tr').click(function(){
      var id = $(this).attr('data-id');
      //alert(id);
      carregarModalCliente(id);
     });
    });


    function carregarModalCliente(id){
     $.ajax({
      url: "<c:url value='/cliente/load/' />" + id,
      method: "POST",
      success: function(result){
       var cont = 1;
       for(i in result){
        //alert(result[i]);
        $("#"+cont).html(result[i]);
        cont++;
       }
       $("#myModal").modal("show");
      }
     });
    }
    
</script>
<h1>Relatório de Clientes - ${tipo}</h1>
<a href="<c:url value="/report/download/${tpDownload}" />" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-print"></span> Versión en PDF
</a>
<table class="table table-hover" id="table-clientes">
    <thead>
        <tr>
            <th><fmt:message key="campo.id" /></th>
            <th><fmt:message key="campo.nome" /></th>
            <th><fmt:message key="campo.email" /></th>
            <th><fmt:message key="campo.pais" /></th>
            <th><fmt:message key="campo.cidade" /></th>
            <th><fmt:message key="campo.telefone" /></th>
                <c:choose>
                    <c:when test='${tpDownload eq "semResposta"}'>
                    <th><fmt:message key="campo.dataUltimoEnvio" /></th>
                    </c:when>
                    <c:otherwise>
                    <th><fmt:message key="campo.idade" /></th>  
                    </c:otherwise>
                </c:choose>

        </tr>
    </thead>
    <tbody>
        <c:forEach items="${clientes}" var="cliente">
            <tr id="dadosClientes" data-id="${cliente.id}">
                <td>${cliente.id}</td>
                <td>${cliente.nome}</td>
                <td>${cliente.email}</td>
                <td>${cliente.pais}</td>
                <td>${cliente.cidade}</td>
                <td>${cliente.telefone}</td>
                <c:choose>
                    <c:when test='${tpDownload eq "semResposta"}'>
                        <td>${cliente.dataEnvioEmailStr}</td>
                    </c:when>
                    <c:otherwise>
                        <td>${cliente.idade}</td>
                    </c:otherwise>
                </c:choose>
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
            
            <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><span id='2'></span></h4>
      </div>
      <div class="modal-body">
          <strong>E-mail:</strong> <span id='3'></span><br />
        <strong>Tipo de Cliente:</strong> <span id='4'></span><br />
        <strong>Teléfono:</strong> <span id='6'></span><br />
        <strong>Celular:</strong> <span id='7'></span><br />
        <strong>Tiempo de contacto:</strong> <span id='9'></span><br />
        <strong>Dirección:</strong> <span id='10'></span><br />
        <strong>Ciudad:</strong> <span id='8'></span><br />
        <strong>País:</strong> <span id='5'></span><br />
        <strong>Información adicional:</strong> <span id='12'></span><br />
         <br />
  
        <strong>Negocios:</strong> <span id='11'></span><br />
        <strong>Edad:</strong> <span id='15'></span><br />
        <strong>Perfil:</strong> <span id='14'></span><br />
        <strong>Disposición:</strong> <span id='17'></span><br />
        <strong>Cantidad máxima:</strong> <span id='18'></span><br />
        <strong>Tiempo de inversión:</strong> <span id='16'></span><br />
        <strong>Bienes:</strong> <span id='19'></span><br />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
            
<%@include file="../template/footer.jsp" %>