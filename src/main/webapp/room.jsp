<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Choisir une Action</title>
    <!-- Inclure ici vos liens vers les fichiers CSS ou autres ressources nécessaires -->
</head>
<body>

<h1>Choisir une Action</h1>

<form action="./RoomTypeServlet" method="post">
    <input type="hidden" name="action" value="ajouter">
    <button type="submit">Ajouter</button>
</form>

<form action="./RoomTypeServlet" method="post">
    <input type="hidden" name="action" value="modifier">
    <button type="submit">Modifier</button>
</form>

<form action="./RoomTypeServlet" method="post">
    <input type="hidden" name="action" value="supprimer">
    <button type="submit">Supprimer</button>
</form>

<!-- Inclure ici d'autres éléments de votre page, comme des formulaires, des liens, etc. -->

</body>
</html>
