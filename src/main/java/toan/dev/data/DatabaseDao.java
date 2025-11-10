package toan.dev.data;

import toan.dev.data.driver.MySQLDriver;
import toan.dev.data.dao.*;
import toan.dev.data.Impl.*;

public class DatabaseDao {
    private static DatabaseDao instance;
    private static MySQLDriver driver;


    public DatabaseDao() {

    }


    public static synchronized DatabaseDao getInstance() {
        if (instance == null) {
            instance = new DatabaseDao();
        }
        return instance;
    }

    public static synchronized void init(MySQLDriver d) {
        driver = d;
    }

    public static MySQLDriver getDriver() {
        if (driver == null) {
            driver = MySQLDriver.getInstance();
        }
        return driver;
    }
}
