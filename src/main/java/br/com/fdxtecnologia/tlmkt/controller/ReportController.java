/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.download.Download;
import br.com.caelum.vraptor.jasperreports.download.ReportDownload;
import br.com.caelum.vraptor.jasperreports.formats.ExportFormats;
import br.com.fdxtecnologia.tlmkt.dao.ClienteDAO;
import br.com.fdxtecnologia.tlmkt.login.Permission;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import br.com.fdxtecnologia.tlmkt.model.ClienteBean;
import br.com.fdxtecnologia.tlmkt.model.ClienteReport;
import br.com.fdxtecnologia.tlmkt.model.TipoCliente;
import br.com.fdxtecnologia.tlmkt.model.TipoUsuario;
import java.util.List;

/**
 *
 * @author Andre
 */
@Resource
@Path("/report")
@Permission({TipoUsuario.ADMIN})
public class ReportController {

    private Result result;
    private ClienteDAO clienteDao;

    public ReportController(Result result, ClienteDAO clienteDao) {
        this.result = result;
        this.clienteDao = clienteDao;
    }

    @Path("/show/{tipo}/{page}")
    public void show(String tipo, Integer page) {

        /*
         * busca[0] = Lista de Clientes
         * busca[1] = Quantidade de Registros (para a paginação)
         */
        Object[] busca;
        if (tipo.equals("semResposta")) {
            result.include("tipo", "Sin Respuesta");
            busca = clienteDao.getClientesSemResposta(page);
            result.include("tpDownload", "semResposta");
        } else {
            TipoCliente tp = TipoCliente.valueOf(tipo.toUpperCase());
            result.include("tipo", tp.toString().toLowerCase());
            busca = clienteDao.getClientesByTipo(tp, page);
            result.include("tpDownload", tp.toString());
        }
        int totalPages = (int) Math.ceil(((Long) busca[1]).intValue() * 1.0 / 30);
        result.include("clientes", busca[0]);
        result.include("totalPages", totalPages);
        result.include("page", page);

    }

    @Path("/download/{tipo}")
    public Download download(String tipo) {
        List<Cliente> clientes;
        ClienteBean bean;
        if (tipo.equals("semResposta")) {
            result.include("tipo", "Sin Respuesta");
            clientes = (List<Cliente>) clienteDao.getClientesSemResposta(0)[0];
            bean = new ClienteBean(clientes, "Sin Respuesta");
        } else {
            TipoCliente tp = TipoCliente.valueOf(tipo.toUpperCase());
            result.include("tipo", tp.toString().toLowerCase());
            clientes = (List<Cliente>) clienteDao.getClientesByTipo(tp, 0)[0];
            bean = new ClienteBean(clientes, tp.toString());
        }
        ClienteReport relatorio = new ClienteReport(bean);
        return new ReportDownload(relatorio, ExportFormats.pdf());
    }
}
