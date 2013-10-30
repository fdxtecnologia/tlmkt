/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fdxtecnologia.tlmkt.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author Andre
 */
@Entity
@Table(name = "clientes")
public class Cliente implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    private String nome;
    private String email;
    @Enumerated(EnumType.STRING)
    private TipoCliente tipoCliente;
    private String pais;
    private String telefone, telefone2;
    private String informacoesAdicionais;
    private String hashForm;
    @Transient
    private String[] listaAtivos;
    //Perfil
    private String perfilInvestidor;
    private String idade;
    private String tempoInvestimento;
    private String disposicao;
    private String quantiaMaxima;
    private String ativos;
    @Temporal(TemporalType.DATE)
    private Date dataEnvioEmail;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public TipoCliente getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(TipoCliente tipoCliente) {
        this.tipoCliente = tipoCliente;
    }

    public String getHashForm() {
        return hashForm;
    }

    public void setHashForm(String hashForm) {
        this.hashForm = hashForm;
    }

    public String getPerfilInvestidor() {
        return perfilInvestidor;
    }

    public void setPerfilInvestidor(String perfilInvestidor) {
        this.perfilInvestidor = perfilInvestidor;
    }

    public String getIdade() {
        return idade;
    }

    public void setIdade(String idade) {
        this.idade = idade;
    }

    public String getTempoInvestimento() {
        return tempoInvestimento;
    }

    public void setTempoInvestimento(String tempoInvestimento) {
        this.tempoInvestimento = tempoInvestimento;
    }

    public String getDisposicao() {
        return disposicao;
    }

    public void setDisposicao(String disposicao) {
        this.disposicao = disposicao;
    }

    public String getQuantiaMaxima() {
        return quantiaMaxima;
    }

    public void setQuantiaMaxima(String quantiaMaxima) {
        this.quantiaMaxima = quantiaMaxima;
    }

    public String[] getListaAtivos() {
        return listaAtivos;
    }

    public void setListaAtivos(String[] listaAtivos) {
        this.listaAtivos = listaAtivos;
    }

    public String getAtivos() {
        return ativos;
    }

    public void setAtivos(String ativos) {
        this.ativos = ativos;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getTelefone2() {
        return telefone2;
    }

    public void setTelefone2(String telefone2) {
        this.telefone2 = telefone2;
    }

    public String getInformacoesAdicionais() {
        return informacoesAdicionais;
    }

    public void setInformacoesAdicionais(String informacoesAdicionais) {
        this.informacoesAdicionais = informacoesAdicionais;
    }

    public Date getDataEnvioEmail() {
        return dataEnvioEmail;
    }

    public void setDataEnvioEmail(Date dataEnvioEmail) {
        this.dataEnvioEmail = dataEnvioEmail;
    }

    public String getDataEnvioEmailStr() {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        return df.format(dataEnvioEmail);
    }

    /**
     * TODO só jesus salva isso
     */
    public boolean getOpcaoAtivo1() {
        return ativos == null ? false : ativos.contains("Plazos Fijos / Tasas de Interés fijas / Renta Fija");
    }

    public boolean getOpcaoAtivo2() {
        return ativos == null ? false : ativos.contains("Renta Variable como Acciones y Fondos de Inversión");
    }

    public boolean getOpcaoAtivo3() {
        return ativos == null ? false : ativos.contains("Monedas como dólares, euros, libras esterlinas, etc.");
    }

    public boolean getOpcaoAtivo4() {
        return ativos == null ? false : ativos.contains("Otros Activos como derivados, notas estructuradas, ETFs, etc.");
    }
}
