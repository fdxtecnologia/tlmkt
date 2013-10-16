function createAlerta(type, message) {
    var closeButton = '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
    var alerta = $("<div class='alert alert-dismissable alert-" + type + "' fade in>" + closeButton + message + "</div>");
    $("#messages").empty().append(alerta);
    setTimeout(function() {
        alerta.alert('close');
    }, 4000);
}