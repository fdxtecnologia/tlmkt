/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.fdxtecnologia.tlmkt.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.simplemail.Mailer;
import br.com.caelum.vraptor.simplemail.template.TemplateMailer;
import br.com.caelum.vraptor.view.Results;
import br.com.fdxtecnologia.tlmkt.dao.ClienteDAO;
import br.com.fdxtecnologia.tlmkt.login.Permission;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import br.com.fdxtecnologia.tlmkt.model.TipoCliente;
import br.com.fdxtecnologia.tlmkt.model.TipoUsuario;
import br.com.fdxtecnologia.tlmkt.utils.CryptoUtils;
import com.google.common.base.Joiner;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Luciano Pucci
 */
@Resource
@Path("/impresos")
@Permission({TipoUsuario.ADMIN, TipoUsuario.USUARIO})
 public class ImpresosController {


    private Result result;
    private ClienteDAO dao;

    

    public ImpresosController(Result result, ClienteDAO dao) {
        this.result = result;
        this.dao = dao;

    }
    
    public void listImpres() {
        List<Cliente> list = dao.getHotLeads();
        result.include("clientesHOT", list);
    }
    
    public void imprimir(String ids){
        String[] id = ids.split(",");
        System.out.println(id.length);
        List<Cliente> clientes = dao.getHotleadsImprimir(ids);
        result.include("clientesHotImprimir", clientes);
        
    }
    
    @Post("/updateDatas/{id}")
    public void promocaoCliente(Long id) {
        Cliente c = dao.findById(id);
        c.setDataUltimaImpressao(new Date());
        dao.update(c);
        result.use(Results.http()).body("ok");
    }
}
