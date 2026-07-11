package br.com.rar.taskmanager.dao;

import java.util.List;

import br.com.rar.taskmanager.model.commons.Cartao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class CartaoDao {

    private EntityManager em;

    public CartaoDao(EntityManager em) {
        this.em = em;
    }

    public void cadastrar(Cartao cartao) {
        em.getTransaction().begin();
        em.persist(cartao);
        em.getTransaction().commit();
    }

    public List<Cartao> listarTodos() {
        String jpql = "SELECT t FROM Cartao t";
        TypedQuery<Cartao> query = em.createQuery(jpql, Cartao.class);
        return query.getResultList();
    }

    public Cartao buscarPorId(Long id) {
        return em.find(Cartao.class, id);
    }

}