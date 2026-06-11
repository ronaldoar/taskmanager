package br.com.rar.taskmanager.controller.commons;

import br.com.rar.taskmanager.dao.JPAUtil;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {
	
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        JPAUtil.close();//fechando a factory de conexoes ao derrubar o server
    }
}
