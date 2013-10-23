/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
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

    public ClienteController(Result result, ClienteDAO dao) {
        this.result = result;
        this.dao = dao;
    }

    public void list() {
        List<Cliente> list = dao.findAll();
        result.include("clientes", list);
    }

    @Post
    public void save(Cliente cliente) {
        boolean isRepeated = false;
        List<Cliente> list = dao.findAll();
        for (Cliente c : list) {
            if (c.getEmail().equals(cliente.getEmail())) {
                isRepeated = true;
            }
        }
        if (cliente.getId() != null && isRepeated == false) {
            dao.update(cliente);
            result.use(Results.json()).withoutRoot().from(cliente).serialize();
        } else if (isRepeated == false && cliente.getId() == null) {
            if (cliente.getTipoCliente() == null) {
                cliente.setTipoCliente(TipoCliente.LEAD);
            }
            dao.add(cliente);
            result.use(Results.json()).withoutRoot().from(cliente).serialize();
        } else {
            result.use(Results.http()).body("erro");
        }
    }

    @Post("/remove/{id}")
    public void remove(Long id) {
        Cliente c = dao.findById(id);
        if (c != null) {
            dao.delete(c);
            result.use(Results.http()).body("ok");
        } else {
            result.use(Results.http()).sendError(500, "Cliente inexistente");
        }
    }

    @Post("/load/{id}")
    public void load(Long id) {
        Cliente c = dao.findById(id);
        if (c != null) {
            result.include("clienteLoaded", c);
            result.use(Results.json()).withoutRoot().from(c).serialize();
        } else {
            result.use(Results.http()).sendError(500, "Cliente inexistente");
        }
    }

    @Path("/formMailing")
    public void formMailing() {
        result.include("cliente", new Cliente());
    }

    @Path("/formMailing/{hash}")
    public void formMailing(String hash) {
        Cliente c = dao.getClientByEmailHash(hash);
        result.include("cliente", c);
    }

    @Post
    public void saveClienteMailing(Cliente cliente, String captcha ) {
        Cliente c = dao.getClientByEmailHash(cliente.getHashForm());
        if(c != null){
            cliente.setId(c.getId());
            dao.update(cliente);
        } else {
            
        }
        result.forwardTo(ClienteController.class).formMailing();
    }
}
