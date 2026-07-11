package br.com.rar.taskmanager.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import br.com.rar.taskmanager.model.commons.Cartao;
import br.com.rar.taskmanager.model.commons.TarefaTipo;

@Entity
@Table(name = "tarefa")
public class Tarefa extends Cartao {

    private TarefaTipo tipo;

    private String responsavel;

    private String prioridade;

    private String tipoServico;

    public TarefaTipo getTipo() {
        return tipo;
    }

    public void setTipo(TarefaTipo tipo) {
        this.tipo = tipo;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public String getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(String prioridade) {
        this.prioridade = prioridade;
    }

    public String getTipoServico() {
        return tipoServico;
    }

    public void setTipoServico(String tipoServico) {
        this.tipoServico = tipoServico;
    }
}