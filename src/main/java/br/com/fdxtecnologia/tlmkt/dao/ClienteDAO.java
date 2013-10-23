/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author guilherme
 */
@Component
public class ClienteDAO extends GenericDAO<Cliente> {

    public ClienteDAO(Session session) {
        super(session);
    }

    public Cliente getClientByEmailHash(String hash) {
        Criteria c = session.createCriteria(Cliente.class);
        c.add(Restrictions.eq("hashForm", hash));
        Cliente cliente = (Cliente) c.uniqueResult();
        return cliente != null ? cliente : new Cliente();
    }
}
