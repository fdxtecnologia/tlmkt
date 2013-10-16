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
import br.com.fdxtecnologia.tlmkt.dao.UsuarioDAO;
import br.com.fdxtecnologia.tlmkt.login.UserSession;
import br.com.fdxtecnologia.tlmkt.model.Usuario;
import java.util.List;

/**
 *
 * @author Andre
 */
@Resource
@Path("/usuario")
public class UsuarioController {

    private Result result;
    private UserSession userSession;
    private UsuarioDAO dao;

    public UsuarioController(Result result, UserSession userSession, UsuarioDAO dao) {
        this.result = result;
        this.userSession = userSession;
        this.dao = dao;
    }

    public void list() {
        List<Usuario> lista = dao.findAll();
        result.include("lista", lista);
    }

    @Path("/load/{id}")
    public void load(Long id) {
        Usuario u = dao.findById(id);
        if (u != null) {
            result.use(Results.json()).from(u).serialize();
        } else {
            result.use(Results.http()).sendError(500, "Cliente inexistente");
        }
    }
    
    @Path("/buscar")
    @Post
    public void buscar(String busca){
        List<Usuario> usuarios = dao.findByQuery(busca);
        result.use(Results.json()).withoutRoot().from(usuarios).serialize();
    }
    
    @Post
    public void save(Usuario usuario) {
        if (usuario.getId() != null) {
            dao.update(usuario);
        } else {
            dao.add(usuario);
        }
        result.use(Results.http()).body("ok");
    }
}
