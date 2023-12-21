package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.RoomType;
import dao.DaoException;
import dao.DaoFactory;
import dao.Roomtypedao;

/**
 * Servlet implementation class RoomTypeServlet
 */
public class RoomTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Roomtypedao roomTypeDao;

	    public void init() throws ServletException {
	        DaoFactory daoFactory = DaoFactory.getInstance();
	        this.roomTypeDao = daoFactory.getRoomTypeDao();
	    }

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		// Récupérer l'action à partir des paramètres de la requête
	    String action = request.getParameter("action");

	    // Choisissez l'action appropriée en fonction du paramètre "action"
	    if ("modifier".equals(action)) {
	        modifierRoomType(request, response);
	    } else if ("supprimer".equals(action)) {
	        supprimerRoomType(request, response);
	    } else {
	        // Action par défaut (liste des types de chambre)
	        listerRoomTypes(request, response);
	    }
       
    }
    

    private void listerRoomTypes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Récupérez la liste des types de chambre depuis la base de données
            List<RoomType> listeRoomTypes = roomTypeDao.listerRoomTypes();

            // Placez la liste dans les attributs de la requête pour l'affichage dans la JSP
            request.setAttribute("roomTypes", listeRoomTypes);

            
            request.getRequestDispatcher("roomTypes.jsp").forward(request, response);
        
        } catch (DaoException e) {
            e.printStackTrace();
            // Gérez l'erreur, redirigez vers une page d'erreur ou faites autre chose
            response.sendRedirect("error.jsp");
        }
    }
    
    
    protected void supprimerRoomType(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer l'identifiant du type de chambre à supprimer depuis les paramètres de la requête
        Long id = Long.parseLong(request.getParameter("id"));

        // Utiliser la classe Roomtypedao pour supprimer le type de chambre
        try {
            roomTypeDao.supprimerRoomType(id);

            listerRoomTypes(request,response); // Rediriger vers une page de succès
        } catch (DaoException e) {
            // Gérer l'erreur, rediriger vers une page d'erreur ou faire autre chose
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    
    
    
   
    
    
    
    
    
    protected void modifierRoomType(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        Long id = Long.parseLong(request.getParameter("id"));
        String label = request.getParameter("label");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        // Utiliser la classe TyperoomDao pour modifier un type de chambre
        try {
            RoomType typeroom = new RoomType();
            typeroom.setId(id);
            typeroom.setLabel(label);
            typeroom.setCapacity(capacity);

            roomTypeDao.modifierRoomType(typeroom);

            this.listerRoomTypes(request, response); // Rediriger vers une page de succès
        } catch (DaoException e) {
            // Gérer l'erreur, rediriger vers une page d'erreur ou faire autre chose
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
    
    
    
    
    
    
