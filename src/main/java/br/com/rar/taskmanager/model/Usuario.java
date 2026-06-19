package br.com.rar.taskmanager.model;

import br.com.rar.taskmanager.model.commons.Pessoa;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario extends Pessoa {
    
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
}
