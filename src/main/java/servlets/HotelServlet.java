package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import beans.Hotel;
import dao.AccountDao;
import dao.DaoException;
import dao.DaoFactory;
import dao.HotelDao;

/**
 * Servlet implementation class HotelServlet
 */
@MultipartConfig
public class HotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
private HotelDao hoteldao;

	@Override
	public void init() throws ServletException {
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.hoteldao = daoFactory.gethoteldao();
	}  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres de recherche depuis la requête
        String nom = request.getParameter("nom");
        String ville = request.getParameter("ville");
        String etoilesStr = request.getParameter("etoiles");

        // Convertir le nombre d'étoiles en entier
        int etoiles = 0;
        if (etoilesStr != null && !etoilesStr.isEmpty()) {
            etoiles = Integer.parseInt(etoilesStr);
        }

        try {
            // Utiliser la méthode rechercherHotels avec les paramètres de recherche
            List<Hotel> listeHotels = hoteldao.listerHotels(nom, ville, etoiles);
            request.setAttribute("listeHotels", listeHotels);
            request.getRequestDispatcher("/listeHotels.jsp").forward(request, response);
        } catch (DaoException e) {
            throw new ServletException("Erreur lors de la récupération de la liste des hôtels", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            ajouterHotel(request, response);
        } else if ("modifier".equals(action)) {
            modifierHotel(request, response);
        } else if ("supprimer".equals(action)) {
            supprimerHotel(request, response);
        } 
    }

    private void ajouterHotel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	Part filePart = request.getPart("image");

            // Obtenez le chemin du fichier
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            System.out.print(fileName);           
            String uploadPath = "C:\\Users\\yosra\\jee\\MiniProjetweb\\src\\main\\webapp\\images\\"+ fileName;
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, Paths.get(uploadPath));
            }
            Hotel nouvelHotel = creerHotelDepuisRequete(request);
            uploadPath="images/"+fileName;
            nouvelHotel.setPath(uploadPath);
            System.out.print(nouvelHotel.toString());
            hoteldao.ajouterHotel(nouvelHotel);
            redirigerVersListeHotels(request,response);
        } catch (DaoException e) {
            throw new ServletException("Erreur lors de l'ajout de l'hôtel", e);
        }
    }

    private void modifierHotel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
System.out.println(idStr);
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Long id = Long.valueOf(idStr);

                // Continuez avec le reste du traitement
                Hotel hotelModifie = creerHotelDepuisRequete(request);
                hotelModifie.setId(id);  // Assurez-vous de définir l'ID dans l'objet Hotel
                hoteldao.modifierHotel(hotelModifie);
                redirigerVersListeHotels(request,response);
            } catch (NumberFormatException | DaoException e) {
                // Gérer les erreurs de conversion de chaîne en Long ou de modification de l'hôtel
                throw new ServletException("Erreur lors de la modification de l'hôtel", e);
            }
        } else {
            // Gérer le cas où l'ID est nul ou vide
            throw new ServletException("ID est nul ou vide");
        }
    }




    private void supprimerHotel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long hotelId = Long.parseLong(request.getParameter("id"));
            hoteldao.supprimerHotel(hotelId);
            redirigerVersListeHotels(request,response);
        } catch (DaoException e) {
            throw new ServletException("Erreur lors de la suppression de l'hôtel", e);
        }
    }

    private Hotel creerHotelDepuisRequete(HttpServletRequest request) {
        Hotel hotel = new Hotel();
      
        hotel.setName(request.getParameter("name"));
        hotel.setCity(request.getParameter("city"));
        hotel.setStars(Integer.parseInt(request.getParameter("stars")));
        hotel.setDescription(request.getParameter("description"));
        
        return hotel;
    }
    private void redirigerVersListeHotels(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/HotelServlet");
    }


}