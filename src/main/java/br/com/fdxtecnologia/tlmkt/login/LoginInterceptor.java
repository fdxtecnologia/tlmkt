/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.login;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.fdxtecnologia.tlmkt.controller.LoginController;
import br.com.fdxtecnologia.tlmkt.model.TipoUsuario;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collection;

/**
 *
 * @author guilherme
 */
//@Intercepts
public class LoginInterceptor implements Interceptor {

    private UserSession userSession;
    private Result result;
    private Method m;

    public LoginInterceptor(UserSession userSession, Result result) {
        this.userSession = userSession;
        this.result = result;
    }

    private boolean hasAccess(Permission permission) {
        if (permission == null) {
            return true;
        }
        Collection<TipoUsuario> roles = Arrays.asList(permission.value());

        return roles.contains(userSession.getUser().getTipo());
    }

    @Override
    public void intercept(InterceptorStack is, ResourceMethod rm, Object o) throws InterceptionException {
        Permission methodPermission = rm.getMethod().getAnnotation(Permission.class);

        Permission controllerPermission = rm.getResource().getType().getAnnotation(Permission.class);

        if (!userSession.isLogged() && (hasAccess(methodPermission) && hasAccess(controllerPermission))) {
            result.redirectTo(LoginController.class).login();
        } else {
            if (hasAccess(methodPermission) && hasAccess(controllerPermission)) {
                is.next(rm, o);
            } else {
                System.out.println("Permission Denied");
            }
        }
    }

    @Override
    public boolean accepts(ResourceMethod rm) {
        return !rm.getResource().getType().isAnnotationPresent(Public.class);
    }
}
