package br.com.rar.taskmanager.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import br.com.rar.taskmanager.model.commons.Pessoa;

@Entity
@Table(name = "contato")
public class Contato extends Pessoa {

	@Column(name = "endereco")
	private String endereco;

	@Column(name = "comentario")
	private String comentario;

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}