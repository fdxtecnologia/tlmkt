/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.fdxtecnologia.tlmkt.login.UserSession;
import br.com.fdxtecnologia.tlmkt.dao.ClienteDAO;
import br.com.fdxtecnologia.tlmkt.dao.UsuarioDAO;
import br.com.fdxtecnologia.tlmkt.login.Permission;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import br.com.fdxtecnologia.tlmkt.model.Usuario;
import br.com.fdxtecnologia.tlmkt.model.TipoCliente;
import br.com.fdxtecnologia.tlmkt.model.TipoUsuario;
import br.com.fdxtecnologia.tlmkt.utils.CryptoUtils;
import com.google.common.base.Joiner;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Andre
 */
@Resource
public class HomeController {

    private Result result;
    private UserSession userSession;
    private ClienteDAO dao;
    private UsuarioDAO daoUser;

    public HomeController(Result result, UserSession userSession, ClienteDAO dao, UsuarioDAO daoUser) {
        this.result = result;
        this.userSession = userSession;
        this.dao = dao;
        this.daoUser = daoUser;
    }

    @Path("/home")
    public void index() {
        List<Cliente> list = dao.getUltimosLeadsADD();
        result.include("clientesLEAD", list);

        List<Cliente> listHot = dao.getUltimosLeadsPromovidos();
        result.include("clientesPROMOV", listHot);

        List<Cliente> listImpressoes = dao.getUltimosLeadsImpressos();
        result.include("clientesIMPRES", listImpressoes);

        List<String> LogsUsuario = new ArrayList<String>();
        int x = 1;
        int length = userSession.getUser().getLogsStr().size();
        if(length > 0) {
            while(x < length){
                LogsUsuario.add(userSession.getUser().getLogsStr().get(userSession.getUser().getLogs().size() - x));
                x++;
                if(x > 5){
                    break;
                }
            }
        }
        result.include("userLogins", LogsUsuario);

    }

    public void listLeads() {

    }
}
