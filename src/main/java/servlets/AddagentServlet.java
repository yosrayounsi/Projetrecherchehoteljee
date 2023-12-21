package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.AccountDao;
import dao.DaoException;
import dao.DaoFactory;

/**
 * Servlet implementation class AddagentServlet
 */
@WebServlet("/AddAgentServlet")
public class AddagentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountDao accountDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.accountDao = daoFactory.getaccountdao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérez les paramètres du formulaire
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try {
            accountDao.addAgent(username, password, email);
            response.sendRedirect("Addagent.jsp"); // Redirigez vers une page de succès
        } catch (DaoException e) {
            // Gérez l'erreur, redirigez vers une page d'erreur ou faites autre chose
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } 
	}}