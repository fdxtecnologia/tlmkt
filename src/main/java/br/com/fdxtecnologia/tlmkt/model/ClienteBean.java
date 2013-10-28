/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.model;

import java.util.List;

/**
 *
 * @author Andre
 */
public class ClienteBean {

    private final List<Cliente> clientes;
    private String tipo;

    public ClienteBean(List<Cliente> clientes, String tipo) {
        this.clientes = clientes;
        this.tipo = tipo;
    }

    public List<Cliente> getClientes() {
        return clientes;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
}
