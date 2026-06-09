package br.com.rar.taskmanager.model;

import br.com.rar.taskmanager.model.commons.Cartao;
import br.com.rar.taskmanager.model.commons.TarefaTipo;

public class Tarefa extends Cartao {
	
	private TarefaTipo tipo;

	public TarefaTipo getTipo() {
		return tipo;
	}

	public void setTipo(TarefaTipo tipo) {
		this.tipo = tipo;
	}
	
}
