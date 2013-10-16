/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.fdxtecnologia.tlmkt.model.Usuario;
import java.util.List;
import org.hibernate.Criteria;
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

    public Usuario getUserByCredentials(String login, String senha) {
        Query q = session.createQuery("from Usuario where login = :login and senha = :senha");
        q.setParameter("login", login);
        q.setParameter("senha", senha);
        Usuario u = (Usuario) q.uniqueResult();
        return u;
    }

    public List<Usuario> findByQuery(String busca) {
        Criteria c = session.createCriteria(Usuario.class);
        c.add(Restrictions.ilike("nome", busca));
        return (List<Usuario>) c.list();
    }
}
