package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.Account;

import beans.BeanException;
import dao.AccountDao;
import dao.DaoException;
import dao.DaoFactory;

@WebServlet("/login")
public class UtilisateurServletLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDao accountDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.accountDao = daoFactory.getaccountdao();}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Account authenticatedAccount = accountDao.authenticate(email, password);
            if (authenticatedAccount != null) {
               if(authenticatedAccount.getRole().equals("admin")) {
            	   response.sendRedirect("Adminborad.jsp");
               }
               else if (authenticatedAccount.getRole().equals("agent")){
            	   response.sendRedirect("Agentdashboard.jsp");
               }
            } else {
                // Authentication failed
                response.sendRedirect("login.jsp?error=1"); // Redirect to login page with an error parameter
            }
        } catch (DaoException | BeanException e) {
            throw new ServletException("Error during authentication", e);
        }
    }
}