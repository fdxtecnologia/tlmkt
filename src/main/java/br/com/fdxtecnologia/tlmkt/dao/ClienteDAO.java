/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import org.hibernate.Session;

/**
 *
 * @author guilherme
 */
@Component
public class ClienteDAO extends GenericDAO<Cliente>{
    
    public ClienteDAO(Session session){
        super(session);
    }
    
    
    
}
