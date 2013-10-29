/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.fdxtecnologia.tlmkt.login.*;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.fdxtecnologia.tlmkt.dao.UsuarioDAO;
import br.com.fdxtecnologia.tlmkt.model.Usuario;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Andre
 */
@Resource
@Path("/login")
@Public
public class LoginController {

    private Result result;
    private UserSession userSession;
    private UsuarioDAO dao;

    public LoginController(Result result, UserSession userSession, UsuarioDAO dao) {
        this.result = result;
        this.userSession = userSession;
        this.dao = dao;
    }

    @Path("/")
    public void login() {
    }

    @Post
    public void doLogin(String login, String senha) throws NoSuchAlgorithmException {
        Usuario u = dao.getUserByCredentials(login, (senha));
        if (u != null) {
            userSession.setUser(u);
            result.forwardTo(HomeController.class).index();
        } else {
            result.include("message", true);
            result.forwardTo(LoginController.class).login();
        }
    }

    public void logout() {
        userSession.setUser(null);
        result.forwardTo(LoginController.class).login();
    }
}
