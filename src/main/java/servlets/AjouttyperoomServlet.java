package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.RoomType;
import dao.DaoException;
import dao.DaoFactory;
import dao.Roomtypedao;


@WebServlet("/AjoutetyperoomServlet")
public class AjouttyperoomServlet extends HttpServlet {
    private Roomtypedao typeroomDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.typeroomDao = daoFactory.getRoomTypeDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String label = request.getParameter("label");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        // Utiliser la classe TyperoomDao pour ajouter un type de chambre
        try {
            RoomType typeroom = new RoomType();
            typeroom.setLabel(label);
            typeroom.setCapacity(capacity);

            typeroomDao.ajouterRoomType(typeroom);

            response.sendRedirect("Ajouttyperoom.jsp"); // Rediriger vers une page de succès
        } catch (DaoException e) {
            // Gérer l'erreur, rediriger vers une page d'erreur ou faire autre chose
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
