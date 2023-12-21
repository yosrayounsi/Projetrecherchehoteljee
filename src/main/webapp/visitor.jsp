<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Search</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Include any necessary CSS styles here -->
</head>
<body>

    <div class="container mt-5">
        <h1>Hotel Search</h1>

        <!-- Search Form -->
        <form action="./Hotelsearchservlett" method="get" class="mb-3">
            <div class="mb-3">
                <label for="city" class="form-label">City:</label>
                <input type="text" id="city" name="city" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="stars" class="form-label">Number of Stars:</label>
                <select id="stars" name="stars" class="form-select" required>
                    <option value="1">1 star</option>
                    <option value="2">2 stars</option>
                    <option value="3">3 stars</option>
                    <option value="4">4 stars</option>
                    <option value="5">5 stars</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <hr>

        <!-- Display Search Results -->
        <h2>Search Results</h2>
        <c:if test="${not empty hotels}">
            <ul class="list-group">
                <c:forEach var="hotel" items="${hotels}">
                    <li class="list-group-item">
                        <a href="HotelDetailsServlet?id=${hotel.id}" class="text-decoration-none">${hotel.name}</a>
                        - ${hotel.stars} stars - ${hotel.city}
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <hr>

        <!-- Hotel Details -->
        <c:if test="${not empty hotelDetails}">
            <h2>Hotel Details</h2>
            <p>Name: ${hotelDetails.name}</p>
            <p>Stars: ${hotelDetails.stars}</p>
            <p>City: ${hotelDetails.city}</p>
            <!-- Add more details as needed -->
        </c:if>
    </div>

    <!-- Bootstrap JS (optional, only if you need Bootstrap JavaScript features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
