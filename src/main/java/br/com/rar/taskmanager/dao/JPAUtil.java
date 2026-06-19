package br.com.rar.taskmanager.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    // O EntityManagerFactory é pesado e deve ser criado APENAS UMA VEZ na aplicação
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskPersistence");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
