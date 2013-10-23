/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.fdxtecnologia.tlmkt.dao.ClienteDAO;
import br.com.fdxtecnologia.tlmkt.model.TipoCliente;

/**
 *
 * @author Andre
 */
@Resource
@Path("/report")
public class ReportController {

    private Result result;
    private ClienteDAO clienteDao;

    public ReportController(Result result, ClienteDAO clienteDao) {
        this.result = result;
        this.clienteDao = clienteDao;
    }

    @Path("/show/{tipo}/{page}")
    public void show(String tipo, Integer page) {
        if (tipo.equals("semResposta")) {
        } else {
            TipoCliente tp = TipoCliente.valueOf(tipo.toUpperCase());
            Object[] busca = clienteDao.getClientesByTipo(tp, page);
            int totalPages = (int) Math.ceil(((Long) busca[1]).intValue() * 1.0 / 30);
            result.include("clientes", busca[0]);
            result.include("totalPages", totalPages);
            result.include("tipo", tp.toString().toLowerCase());
            result.include("page", page);
        }
    }
}
