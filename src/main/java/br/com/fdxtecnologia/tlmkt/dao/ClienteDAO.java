/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.fdxtecnologia.tlmkt.model.Cliente;
import br.com.fdxtecnologia.tlmkt.model.TipoCliente;
import java.util.Calendar;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
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

    public Object[] getClientesByTipo(TipoCliente tipo, int pagina) {
        try {
            Object[] response = new Object[2];
            Criteria c = session.createCriteria(Cliente.class);
            c.add(Restrictions.eq("tipoCliente", tipo));
            if (pagina != 0) {
                c.setFirstResult((pagina - 1) * 30);
                c.setMaxResults(30);
            }
            response[0] = (List<Cliente>) c.list();
            //Count para paginação
            if (pagina > 0) {
                response[1] = ((Long) session.createQuery("select count(id) from Cliente where tipoCliente = '" + tipo + "'")
                        .iterate()
                        .next()).longValue();
            } else {
                response[1] = 0;
            }
            return response;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Object[] getClientesSemResposta(int pagina) {
        Calendar cal = Calendar.getInstance();
        
        cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) - 3);
        try {
            Object[] response = new Object[2];
            Criteria c = session.createCriteria(Cliente.class);
            c.add(Restrictions.eq("tipoCliente", TipoCliente.LEAD));
            c.add(Restrictions.le("dataEnvioEmail", cal.getTime()));
            if (pagina != 0) {
                c.setFirstResult((pagina - 1) * 30);
                c.setMaxResults(30);
            }
            response[0] = (List<Cliente>) c.list();
            //Count para paginação

            if (pagina > 0) {
                Query query = session.createQuery("select count(id) from Cliente where tipoCliente = 'LEAD' and dataEnvioEmail < :dataEnvio");
                query.setParameter("dataEnvio", cal.getTime());
                response[1] = ((Long) query.iterate().next()).longValue();
            } else {
                response[1] = 0;
            }
            return response;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }
}
