/*
 * To change this template, choose Tools | Templates
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
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;

/**
 *
 * @author guilherme
 */
@Resource
@Path("/cliente")
@Permission({TipoUsuario.ADMIN, TipoUsuario.USUARIO})
public class ClienteController {

    private Result result;
    private ClienteDAO dao;
    private Mailer mailer;
    private final TemplateMailer templates;

    public ClienteController(Result result, ClienteDAO dao, Mailer mailer, TemplateMailer templates) {
        this.result = result;
        this.dao = dao;
        this.mailer = mailer;
        this.templates = templates;
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
        cliente.setAtivos(Joiner.on("|").join(cliente.getListaAtivos()));
        if (cliente.getId() != null) {
            dao.update(cliente);
            result.redirectTo(ClienteController.class).list();
        } else if (isRepeated == false && cliente.getId() == null) {
            if (cliente.getTipoCliente() == null) {
                cliente.setTipoCliente(TipoCliente.LEAD);
            }
            cliente.setDataCadastro(new Date());
            Cliente c = dao.addReturnId(cliente);
            System.out.println(c.getId());
            try {
                enviarEmailClienteCadastro(c.getId());
                //System.out.println(c.getId());
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
            }
            result.include("message","ok");
            result.redirectTo(ClienteController.class).list();
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
    
    @Post("/promocao/{id}")
    public void promocaoCliente(Long id) {
        Cliente c = dao.findById(id);
        c.setTipoCliente(TipoCliente.HOT_LEAD);
        c.setDataPromocao(new Date());
        dao.update(c);
        result.use(Results.http()).body("ok");
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

    @Path("/add")
    public void add() {
    }

    @Path("/formMailing/{hash}")
    public void formMailing(String hash) {
        Cliente c = dao.getClientByEmailHash(hash);
        result.include("cliente", c);
    }

    @Path("/edit/{id}")
    public void edit(Long id) {
        Cliente c = dao.findById(id);
        if (c != null) {
            result.include("cliente", c);
        } else {
            result.include("message", "Usuario inexistente");
            result.forwardTo(UsuarioController.class).list();
        }
    }

    @Post
    public void saveClienteMailing(Cliente cliente) {
        cliente.setAtivos(Joiner.on("|").join(cliente.getListaAtivos()));
        Cliente c = dao.getClientByEmailHash(cliente.getHashForm());
        if (c != null) {
            cliente.setId(c.getId());
            dao.update(cliente);
        } else {
            dao.add(cliente);
        }
        result.forwardTo(ClienteController.class).formMailing();
    }

    @Post
    public void enviarEmailCliente(Long id) throws NoSuchAlgorithmException {
        Cliente cliente = dao.findById(id);
        //System.out.println(id);
        //System.out.println(cliente);
        if (cliente != null) {

            if (cliente.getHashForm() == null) {
                cliente.setHashForm(CryptoUtils.sha1(new Date().getTime()));
                cliente.setDataEnvioEmail(new Date());
                dao.update(cliente);
            }
            try {
                Email email = this.templates
                        .template("templateMailing")
                        .with("cliente", cliente)
                        .to(cliente.getNome(), cliente.getEmail());
                //System.out.println(cliente.getEmail());
                email.setFrom("no-responda@ecofincapital.com", "Ecofin");
                email.setSubject("Nos Gustaria Saber más sobre usted!");
                //System.out.println(email.getToAddresses());
                //System.out.println(email.getSubject());
                mailer.send(email);
            } catch (EmailException e) {
            }
             result.nothing();
        }
    }
    
    public void enviarEmailClienteCadastro(Long id) throws NoSuchAlgorithmException {
        Cliente cliente = dao.findById(id);
        //System.out.println(id);
        //System.out.println(cliente);
        if (cliente != null) {

            if (cliente.getHashForm() == null) {
                cliente.setHashForm(CryptoUtils.sha1(new Date().getTime()));
                cliente.setDataEnvioEmail(new Date());
                dao.update(cliente);
            }
            try {
                Email email = this.templates
                        .template("templateMailing")
                        .with("cliente", cliente)
                        .to(cliente.getNome(), cliente.getEmail());
                //System.out.println(cliente.getEmail());
                email.setFrom("no-responda@ecofincapital.com", "Ecofin");
                email.setSubject("Nos Gustaria Saber más sobre usted!");
                //System.out.println(email.getToAddresses());
                //System.out.println(email.getSubject());
                mailer.send(email);
            } catch (EmailException e) {
            }
             result.nothing();
        }
    }
}
