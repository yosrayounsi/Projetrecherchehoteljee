package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Hotel;
import beans.Photo;


public class HotelDao {
    private DaoFactory daoFactory;

    HotelDao(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    public List<Hotel> listerHotels(String nom, String ville, int nombreEtoiles) throws DaoException {
        List<Hotel> listeHotels = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = daoFactory.getConnection();

            // Construire la requête SQL en fonction des critères de recherche
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM hotels WHERE 1");

            if (nom != null && !nom.isEmpty()) {
                queryBuilder.append(" AND name LIKE ?");
            }

            if (ville != null && !ville.isEmpty()) {
                queryBuilder.append(" AND city LIKE ?");
            }

            if (nombreEtoiles > 0) {
                queryBuilder.append(" AND stars = ?");
            }

            String query = queryBuilder.toString();
            preparedStatement = connection.prepareStatement(query);

            // Remplir les paramètres de la requête en fonction des critères
            int parameterIndex = 1;
            if (nom != null && !nom.isEmpty()) {
                preparedStatement.setString(parameterIndex++, "%" + nom + "%");
            }

            if (ville != null && !ville.isEmpty()) {
                preparedStatement.setString(parameterIndex++, "%" + ville + "%");
            }

            if (nombreEtoiles > 0) {
                preparedStatement.setInt(parameterIndex++, nombreEtoiles);
            }

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String city = resultSet.getString("city");
                String description = resultSet.getString("description");
                int stars = resultSet.getInt("stars");
String path= resultSet.getString("path");
                Hotel hotel = new Hotel();
                hotel.setId(id);
                hotel.setName(name);
                hotel.setCity(city);
                hotel.setDescription(description);
                hotel.setStars(stars);
hotel.setPath(path);
listeHotels.add(hotel);
            }
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données");
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                throw new DaoException("Erreur lors de la fermeture des ressources");
            }
        }

        return listeHotels;
    }


    public void ajouterHotel(Hotel hotel) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String query = "INSERT INTO hotels (name, city, description,stars,path) VALUES (?, ?, ?, ?, ?);";
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, hotel.getName());
            preparedStatement.setString(2, hotel.getCity());
           
            preparedStatement.setString(3, hotel.getDescription());
            preparedStatement.setInt(4, hotel.getStars());
            preparedStatement.setString(5, hotel.getPath());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de l'ajout de l'hôtel dans la base de données");
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                throw new DaoException("Erreur lors de la fermeture des ressources");
            }
        }
    }
   
    public void modifierHotel(Hotel hotel) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String query = "UPDATE hotels SET name=?, city=?,  description=?,stars=? WHERE id=?";
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, hotel.getName());
            preparedStatement.setString(2, hotel.getCity());
          
            preparedStatement.setString(3, hotel.getDescription());
            preparedStatement.setInt(4, hotel.getStars());
            preparedStatement.setLong(5, hotel.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de la modification de l'hôtel dans la base de données");
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                throw new DaoException("Erreur lors de la fermeture des ressources");
            }
        }
    }

    public void supprimerHotel(Long hotelId) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String query = "DELETE FROM hotels WHERE id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, hotelId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de la suppression de l'hôtel dans la base de données");
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                throw new DaoException("Erreur lors de la fermeture des ressources");
            }
        }
    }
}
