package dao;

import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Account;
import beans.BeanException;


public class AccountDao {
	 private DaoFactory daoFactory;
	 
	 AccountDao(DaoFactory daoFactory) {
	        this.daoFactory = daoFactory;
	    }
	 
	public ArrayList<Account> lister() throws DaoException, BeanException{
		ArrayList<Account> listedesAccounts= new ArrayList<>();
		Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM account;");	
            while (resultat.next()) {
            	int id = resultat.getInt("idAccount");
                String nom = resultat.getString("username");
                String pass = resultat.getString("password");
                String email = resultat.getString("email");
                String role = resultat.getString("role");

                Account Account = new Account();
                Account.setIdAccount(id);
                Account.setUsername(nom);
                Account.setPassword(pass);
               Account.setEmail(email);
               Account.setRole(role);
                listedesAccounts.add(Account);
                
            }
        } 
        catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données");
        }
        finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données");
            }
        }
        return listedesAccounts;
    }
	public Account authenticate(String email, String password) throws DaoException, BeanException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Account authenticatedAccount = null;

        try {
            connection = daoFactory.getConnection();
            String query = "SELECT * FROM account WHERE email = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                authenticatedAccount = new Account();
                authenticatedAccount.setUsername(resultSet.getString("username"));
                authenticatedAccount.setPassword(resultSet.getString("password"));
                authenticatedAccount.setEmail(resultSet.getString("email"));
                authenticatedAccount.setRole(resultSet.getString("role"));
            }
        } catch (SQLException e) {
            throw new DaoException("Error while authenticating the user");
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }

        return authenticatedAccount;
    }
	private void closeResources(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet)
            throws DaoException {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new DaoException("Error while closing resources");
        }
    }

	
	public void addAgent(String username, String password, String email) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String query = "INSERT INTO account (username, password, email, role) VALUES (?, ?, ?, 'agent')";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);

            // Exécute la requête d'insertion
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Error while adding agent to the database");
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }	
	
}