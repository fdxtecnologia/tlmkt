/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.model;

import br.com.caelum.vraptor.jasperreports.Report;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Andre
 */
public class ClienteReport implements Report {

    private final List<ClienteBean> data;
    private Map<String, Object> parameters;
    private boolean semResposta;

    public ClienteReport(List<ClienteBean> data) {
        this.data = data;
    }

    public ClienteReport(ClienteBean clientes) {
        data = new ArrayList<ClienteBean>();
        data.add(clientes);
    }

    @Override
    public String getTemplate() {
        if (data.get(0).getTipo().equals("Sin Respuesta")) {
            return "clientes_semresposta.jasper";
        } else {
            return "clientes.jasper";
        }
    }

    @Override
    public Map<String, Object> getParameters() {
        return this.parameters;
    }

    @Override
    public Collection getData() {
        return this.data;
    }

    @Override
    public String getFileName() {
        DateFormat df = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        return "clientes_" + df.format(new Date());
    }

    @Override
    public Report addParameter(String parameter, Object value) {
        this.parameters.put(parameter, value);
        return this;
    }

    @Override
    public boolean isCacheable() {
        return false;
    }
}
