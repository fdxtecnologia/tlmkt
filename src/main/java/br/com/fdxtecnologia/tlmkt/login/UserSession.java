/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.login;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.fdxtecnologia.tlmkt.model.Usuario;

/**
 *
 * @author guilherme
 */
@Component
@SessionScoped
public class UserSession {

    private Usuario user;

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public boolean isLogged() {
        return user != null;
    }

    public void logout() {
        user = null;
    }
}
