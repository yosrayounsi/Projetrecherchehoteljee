package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.Hotel;
import dao.DaoException;
import dao.DaoFactory;
import dao.HotelDao;

/**
 * Servlet implementation class Hotelsearchservlett
 */
public class Hotelsearchservlett extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HotelDao hoteldao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hotelsearchservlett() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.hoteldao = daoFactory.gethoteldao();
	}   
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  // Retrieve parameters from the request
        String city = request.getParameter("city");
        int stars = Integer.parseInt(request.getParameter("stars"));
     // Convertir le nombre d'étoiles en entier
       

        try {
            // Utiliser la méthode rechercherHotels avec les paramètres de recherche
            List<Hotel> listeHotels = hoteldao.listerHotels(null, city, stars);
            request.setAttribute("hotels", listeHotels);
            request.getRequestDispatcher("/sty/blog.jsp").forward(request, response);
        } catch (DaoException e) {
            throw new ServletException("Erreur lors de la récupération de la liste des hôtels", e);
        }
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
