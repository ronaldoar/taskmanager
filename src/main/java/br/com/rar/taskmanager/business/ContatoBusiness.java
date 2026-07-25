package br.com.rar.taskmanager.business;

import br.com.rar.taskmanager.dao.ContatoDao;
import br.com.rar.taskmanager.model.Contato;
import jakarta.persistence.EntityManager;

public class ContatoBusiness {
	
	public void cadastrar(EntityManager em, Contato contato) {
		ContatoDao dao = new ContatoDao(em);
		
		if(dao.buscarPorEmail(contato.getEmail()) == null) {
			dao.cadastrar(contato);
		}else {
			throw new IllegalArgumentException("Usuário já existe.");
		}
	}
}
