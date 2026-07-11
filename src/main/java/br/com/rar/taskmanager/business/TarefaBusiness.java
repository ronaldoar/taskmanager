package br.com.rar.taskmanager.business;

import br.com.rar.taskmanager.dao.CartaoDao;
import br.com.rar.taskmanager.dao.UsuarioDao;
import br.com.rar.taskmanager.model.Usuario;
import br.com.rar.taskmanager.model.commons.Cartao;
import jakarta.persistence.EntityManager;

public class TarefaBusiness {
	
	public void cadastrar(EntityManager em, Cartao cartao) {
		CartaoDao dao = new CartaoDao(em);
		
		
	}
}
