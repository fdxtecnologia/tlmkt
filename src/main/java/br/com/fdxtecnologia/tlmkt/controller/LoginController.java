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

/**
 *
 * @author Andre
 */
@Resource
public class LoginController {

    private Result result;
    private UserSession userSession;

    public LoginController(Result result, UserSession userSession) {
        this.result = result;
        this.userSession = userSession;
    }

    @Path("/login/")
    public void login() {
    }
    
    @Post
    @Path("/login/")
    public void login(String login, String senha){
        
    }
}
