package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.RoomType;

public class Roomtypedao {
    private DaoFactory daoFactory;

    public Roomtypedao(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    public List<RoomType> listerRoomTypes() throws DaoException {
        List<RoomType> listeRoomTypes = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = daoFactory.getConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM room_types");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                RoomType roomType = map(resultSet);
                listeRoomTypes.add(roomType);
            }
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de la récupération des types de chambre depuis la base de données");
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }

        return listeRoomTypes;
    }

    public void ajouterRoomType(RoomType roomType) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO room_types (label, capacity) VALUES (?, ?)"
            );
            preparedStatement.setString(1, roomType.getLabel());
            preparedStatement.setInt(2, roomType.getCapacity());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de l'ajout du type de chambre dans la base de données");
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }

    public void modifierRoomType(RoomType roomType) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            preparedStatement = connection.prepareStatement(
                    "UPDATE room_types SET label=?, capacity=? WHERE id=?"
            );
            preparedStatement.setString(1, roomType.getLabel());
            preparedStatement.setInt(2, roomType.getCapacity());
            preparedStatement.setLong(3, roomType.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de la modification du type de chambre dans la base de données");
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }

    public void supprimerRoomType(Long roomTypeId) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            preparedStatement = connection.prepareStatement(
                    "DELETE FROM room_types WHERE id=?"
            );
            preparedStatement.setLong(1, roomTypeId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de la suppression du type de chambre dans la base de données");
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }

    private RoomType map(ResultSet resultSet) throws SQLException {
        RoomType roomType = new RoomType();
        roomType.setId(resultSet.getLong("id"));
        roomType.setLabel(resultSet.getString("label"));
        roomType.setCapacity(resultSet.getInt("capacity"));
        return roomType;
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
            throw new DaoException("Erreur lors de la fermeture des ressources");
        }
    }
    
    public RoomType getRoomTypeById(Long roomTypeId) throws DaoException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        RoomType roomType = null;

        try {
            connection = daoFactory.getConnection();
            String query = "SELECT * FROM room_types WHERE id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, roomTypeId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                roomType = new RoomType();
                roomType.setId(resultSet.getLong("id"));
                roomType.setLabel(resultSet.getString("label"));
                roomType.setCapacity(resultSet.getInt("capacity"));
                // Ajoutez d'autres attributs si nécessaire
            }
        } catch (SQLException e) {
            throw new DaoException("Erreur lors de la récupération du type de chambre par ID");
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }

        return roomType;
    }

}
