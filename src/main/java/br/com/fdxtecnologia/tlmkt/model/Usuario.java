/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Andre
 */
@Entity
@Table(name = "usuarios")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    private String nome;
    private String login;
    private String senha;
    @ElementCollection
    @CollectionTable(name = "login_logs", joinColumns = @JoinColumn(name = "user_id"))
    private List<Date> logs;
    @Enumerated(EnumType.STRING)
    private TipoUsuario tipo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public TipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TipoUsuario tipo) {
        this.tipo = tipo;
    }

    public List<Date> getLogs() {
        return logs;
    }

    public void setLogs(List<Date> logs) {
        this.logs = logs;
    }

    public List<String> getLogsStr() {
        List<String> listaDataStr = new ArrayList<String>();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        for (Date data : logs) {
            listaDataStr.add(df.format(data));
        }
        return listaDataStr;
    }

}
