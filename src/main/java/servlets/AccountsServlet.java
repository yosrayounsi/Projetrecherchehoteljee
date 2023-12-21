package servlets;

import java.io.IOException;
import java.util.ArrayList;
import beans.BeanException;
import dao.AccountDao;
import dao.DaoException;
import dao.DaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import beans.Account;


/**
 * Servlet implementation class AccountsServlet
 */
public class AccountsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
private AccountDao accountdao;
	
	@Override
	public void init() throws ServletException {
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.accountdao = daoFactory.getaccountdao();
	}
	  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			try {
				ArrayList<Account> v=new ArrayList <>();
				v= accountdao.lister();
				request.setAttribute("accounts", v);
				//System.out.println(v);
				System.out.println(request.getAttribute("agents"));
			} catch (BeanException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (DaoException e) {
			request.setAttribute("erreur", e.getMessage());
		}
		this.getServletContext().getRequestDispatcher("/listeaccount.jsp").forward(request, response);
	}
}
