package cn.ved.ssmblog.listener;


import com.mysql.jdbc.AbandonedConnectionCleanupThread;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
/*自定义监听器，在servlet关闭时，关闭jdbc，回收资源*/
@Component
public class WebListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        Driver driver = null;
        while (drivers.hasMoreElements()) {
            try {
                driver = drivers.nextElement();
                DriverManager.deregisterDriver(driver);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        AbandonedConnectionCleanupThread.checkedShutdown();
    }
}
