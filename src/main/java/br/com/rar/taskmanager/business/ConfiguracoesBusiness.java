package br.com.rar.taskmanager.business;

import br.com.rar.taskmanager.dao.UsuarioDao;
import br.com.rar.taskmanager.model.Usuario;
import jakarta.persistence.EntityManager;

public class ConfiguracoesBusiness {
			
	public void cadastrar(EntityManager em, Usuario usuario) {
		UsuarioDao dao = new UsuarioDao(em);
		
		if(dao.buscarPorEmail(usuario.getEmail()) == null){
			dao.cadastrar(usuario);
		}else {
			throw new IllegalArgumentException("Usuário já existe.");
		}
	}
}
