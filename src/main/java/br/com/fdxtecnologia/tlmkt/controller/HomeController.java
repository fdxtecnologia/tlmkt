/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.fdxtecnologia.tlmkt.login.UserSession;

/**
 *
 * @author Andre
 */
@Resource
public class HomeController {
    
    private Result result;
    private UserSession userSession;

    public HomeController(Result result, UserSession userSession) {
        this.result = result;
        this.userSession = userSession;
    }
    
    @Path("")
    public void index(){
        
    }
    
}
