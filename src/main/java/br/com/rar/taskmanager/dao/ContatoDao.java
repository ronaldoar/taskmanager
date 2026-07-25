package br.com.rar.taskmanager.dao;

import java.util.List;
import br.com.rar.taskmanager.model.Contato;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class ContatoDao {
	
	private EntityManager em;
	
	public ContatoDao(EntityManager em) {
		this.em = em;
	}
	
	public void cadastrar(Contato contato) {
		em.getTransaction().begin();
		em.persist(contato);
		em.getTransaction().commit();
		
	}
	
	public List<Contato> listarTodos(){
		String jpql = "SELECT c FROM Contato c";
		TypedQuery<Contato> query = em.createQuery(jpql, Contato.class);
		return query.getResultList();
	}
	
	public Contato buscarPorId(Long id) {
		return em.find(Contato.class, id);
	}
	public Contato buscarPorEmail(String email) {
        String jpql = "SELECT c FROM Contato c WHERE c.email = :pEmail";
        
        try {
            return em.createQuery(jpql, Contato.class).setParameter("pEmail", email).getSingleResult(); // Retorna um único objeto
        } catch (jakarta.persistence.NoResultException e) {
            return null; // Retorna null se não encontrar nenhum usuário com esse email
        }
    }
	public void atualizar(Contato contato) {

	    em.getTransaction().begin();

	    em.merge(contato);

	    em.getTransaction().commit();

	}
	public void excluir(Long id) {

	    em.getTransaction().begin();

	    Contato contato = em.find(Contato.class, id);

	    if (contato != null) {
	        em.remove(contato);
	    }

	    em.getTransaction().commit();

	}
}
