/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.fdxtecnologia.tlmkt.dao.ClienteDAO;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import br.com.fdxtecnologia.tlmkt.model.TipoCliente;
import java.util.List;

/**
 *
 * @author guilherme
 */
@Resource
@Path("/cliente")
public class ClienteController {
    
    private Result result;
    private ClienteDAO dao;
    
    public ClienteController (Result result, ClienteDAO dao){
        this.result = result;
        this.dao = dao;
    }
    
    public void list(){
        List<Cliente> list = dao.findAll();
        result.include("clientes", list);
    }
    
    public void save(Cliente cliente){
        cliente.setTipoCliente(TipoCliente.LEAD);
        if (cliente.getId() != null) {
            dao.update(cliente);
        } else {
            dao.add(cliente);
        }
        result.use(Results.http()).body("ok");
    }
    
    @Path("/edit/{id}")
    public void edit(Long id) {
        Cliente c = dao.findById(id);
        if (c != null) {
            result.include("cliente",c);
            result.use(Results.json()).from(c).serialize();
        } else {
            result.use(Results.http()).sendError(500, "Cliente inexistente");
        }
    }
    
}
