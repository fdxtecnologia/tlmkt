/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.fdxtecnologia.tlmkt.model.Usuario;
import br.com.fdxtecnologia.tlmkt.utils.CryptoUtils;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Andre
 */
@Component
public class UsuarioDAO extends GenericDAO<Usuario> {
    

    public UsuarioDAO(Session session) {
        super(session);
    }

    public Usuario getUserByCredentials(String login, String senha) throws NoSuchAlgorithmException {
        Criteria c = session.createCriteria(Usuario.class);
        c.add(Restrictions.eq("login", login)).add(Restrictions.eq("senha", CryptoUtils.sha1(senha)));
        Usuario u = (Usuario) c.uniqueResult();
        return u;
    }

    public List<Usuario> findByQuery(String busca) {
        Criteria c = session.createCriteria(Usuario.class);
        c.add(Restrictions.ilike("nome", busca));
        return (List<Usuario>) c.list();
    }
    
    
}
