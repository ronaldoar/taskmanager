package br.com.rar.taskmanager.controller.commons;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class StartupListener implements ServletContextListener {
	

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println(">>> INICIANDO A APLICAÇÃO E O JPA... <<<");
        try {
            // Este é o comando que FORÇA o Hibernate a conectar e criar as tabelas
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("taskPersistence");
            System.out.println(">>> CONEXÃO COM O BANCO ESTABELECIDA COM SUCESSO! <<<");
            
            // Salva no contexto da aplicação para usar depois (opcional, mas boa prática)
            sce.getServletContext().setAttribute("EMF", emf);
        } catch (Exception e) {
            System.err.println(">>> ERRO FATAL AO INICIAR O JPA: <<<");
            e.printStackTrace(); // Isso vai aparecer no console do Eclipse
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        EntityManagerFactory emf = (EntityManagerFactory) sce.getServletContext().getAttribute("EMF");
        if (emf != null && emf.isOpen()) {
            emf.close();
            System.out.println(">>> JPA FINALIZADO COM SUCESSO. <<<");
        }
    }
}
