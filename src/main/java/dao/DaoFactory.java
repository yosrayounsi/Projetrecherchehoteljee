package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoFactory {
    private String url;
    private String username;
    private String password;

    DaoFactory(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public static DaoFactory getInstance() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }
        DaoFactory instance = new DaoFactory("jdbc:mysql://localhost:3306/hoteljee", "root", "root");
        return instance;
    }

    public Connection getConnection() throws SQLException {
    	Connection connexion = DriverManager.getConnection(url, username, password);
       
        return connexion; 
    }
   
    // Récupération du Dao
    public AccountDao getaccountdao() {
        return new AccountDao(this);
    }
    public HotelDao gethoteldao() {
        return new HotelDao(this);
    }
    public Roomtypedao getRoomTypeDao() {
        return new Roomtypedao(this);
    }
}