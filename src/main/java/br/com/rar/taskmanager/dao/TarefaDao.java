package br.com.rar.taskmanager.dao;

import java.util.List;
import br.com.rar.taskmanager.model.Tarefa;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class TarefaDao {

    private EntityManager em;

    public TarefaDao(EntityManager em) {
        this.em = em;
    }

    public void cadastrar(Tarefa tarefa) {
        em.getTransaction().begin();
        em.persist(tarefa);
        em.getTransaction().commit();
    }

    public List<Tarefa> listarTodos() {
        String jpql = "SELECT t FROM Tarefa t";
        TypedQuery<Tarefa> query = em.createQuery(jpql, Tarefa.class);
        return query.getResultList();
    }

    public Tarefa buscarPorId(Long id) {
        return em.find(Tarefa.class, id);
    }
}