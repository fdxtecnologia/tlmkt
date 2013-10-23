/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.fdxtecnologia.tlmkt.dao.ClienteDAO;

/**
 *
 * @author Andre
 */
@Resource
@Path("/reports")
public class ReportController {

    private Result result;
    private ClienteDAO clienteDao;

    public ReportController(Result result, ClienteDAO clienteDao) {
        this.result = result;
        this.clienteDao = clienteDao;
    }
    
    
}
