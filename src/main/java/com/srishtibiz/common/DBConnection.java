package com.srishtibiz.common;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection()
            throws URISyntaxException, SQLException, ClassNotFoundException {
        // DATABASE_URL
        // mysql://<host>:<port>/<dbname>
        Class.forName("org.postgresql.Driver");
        String dbUrl = "jdbc:" + System.getenv("SRISHTI_DATABASE_URL");
        String username = System.getenv("SRISHTI_DATABASE_USER");
        String password = System.getenv("SRISHTI_DATABASE_PASSWORD");
        return DriverManager.getConnection(dbUrl, username, password);
    }
}
