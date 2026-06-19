package br.com.rar.taskmanager.dao;

import java.util.List;

import br.com.rar.taskmanager.model.Usuario;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UsuarioDao {
	
    private EntityManager em;
    
    public UsuarioDao(EntityManager em) {
        this.em = em;
    }
    
    public void cadastrar(Usuario usuario) {
    	 em.getTransaction().begin();
         em.persist(usuario);
         em.getTransaction().commit();
    }

    // 1. Buscar todos os usuários (Retorna uma Lista)
    public List<Usuario> listarTodos() {
        String jpql = "SELECT u FROM Usuario u"; // "Usuario" é o nome da classe @Entity
        TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
        return query.getResultList(); // Apenas executa, sem transação
    }

    // 2. Buscar por ID (O método mais simples e direto do JPA)
    public Usuario buscarPorId(Long id) {
        return em.find(Usuario.class, id); // Busca direta pela chave primária
    }

    // 3. Buscar por um filtro específico (Exemplo: por Email)
    public Usuario buscarPorEmail(String email) {
        String jpql = "SELECT u FROM Usuario u WHERE u.email = :pEmail";
        
        try {
            return em.createQuery(jpql, Usuario.class).setParameter("pEmail", email).getSingleResult(); // Retorna um único objeto
        } catch (jakarta.persistence.NoResultException e) {
            return null; // Retorna null se não encontrar nenhum usuário com esse email
        }
    }
    
    public Usuario buscarPorUsername(String username) {
        String jpql = "SELECT u FROM Usuario u WHERE u.username = :pUsername";
        
        try {
            return em.createQuery(jpql, Usuario.class).setParameter("pUsername", username).getSingleResult(); 
        } catch (jakarta.persistence.NoResultException e) {
            return null; // Retorna null se não encontrar nenhum usuário com esse email
        }
    }
}
