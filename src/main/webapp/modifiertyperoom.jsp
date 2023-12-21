<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Types de Chambre</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
*{
    padding: 0;
    margin: 0;
    color: white;
    font-family: sans-serif;
}
body{
    background-color:#001;
    display: flex;

}
.profile{
    display: flex;
    align-items: center;
    gap: 30px;
}
.profile h2{
    font-size: 20px;
    text-transform: capitalize;
}
.main-header {
  
  border-radius: 40px;
  padding: 20px;
  width: 100%;
  max-width: 650px;
}
.main-header .main-form form .input-group input + input {
  margin-right: 8px;
}

.main-header .main-form form .input-group .all_day {
  width: 120px;
  height: 50px;
  text-align: right;
  padding: 18px 0;
  margin-top: 8px;
  color: #a6a6a6;
}

.main-header .main-form form .input-group .checkbox {
  width: 60px;
  height: 30px;
  color: #a6a6a6;
  border: 1px solid #dcdce6;
  border-radius: 10px;
  margin-left: 10px;
}

.main-header .main-form form .input-group .hour {
  width: 219px;
}

.main-header .main-form form .button {
  width: 100%;
  height: 60px;
  background: #3ba8d4;
  border: 0;
  border-radius: 10px;
  color: #fff;
  font-weight: 700;
  margin: 20px 0 15px 0;
  display: inline-block;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
  transition: filter 0.2s;
  cursor: pointer;
    justify-content: center;
    width: 60vh;

}


.button:hover {
  filter: brightness(90%);
}
.main-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 80vh;
    width: 160vh;
   
}

.img-box{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    border: 3px solid white;
    flex-shrink: 0;
}
form input {
  width: 100%;
  height: 50px;
  color: #a6a6a6;
  border: 1px solid #dcdce6;
  border-radius: 8px;
  padding: 0 24px;
}

.main-header .main-form form {
  width: 100%;
  max-width: 450px;
}

.main-header .main-form form input {
  margin-top: 8px;
}

.main-header .main-form form .input-group {
  display: flex;
  align-items: center;
  justify-content: center;
}
.img-box img{
    width: 100%;
}

.menu{
    background-color: #123;
    width: 60px;
    height: 100vh;
    padding: 20px;
    overflow: hidden;
    transition: 0.5s;
}
.menu:hover{
    width: 260px;
}
ul{
    list-style: none;
    position: relative;
    height: 95%;
}
ul li a{
    display: block;
    text-decoration: none;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
    display: flex;
    gap: 40px;
    align-items: center;
    transition: 0.5s;

}
ul li a:hover, .active , .box:hover, td:hover{
    background-color: #ffffff55;
}
.log-out{
    position: absolute;
    bottom: 0;
    width: 100%;

}
.log-out a{
    background-color:#a00 ;
}
ul li a i{
    font-size: 30px;
}
.content{
    width: 100%;
    margin: 10px;
}
.title-info{
    background-color: #0481ff;
    padding: 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-radius: 8px;
    margin: 10px 0;
}
.data-info{
    display:flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 10px;

}
.box{
    background-color: #123;
    height: 150px;
    flex-basis: 150px;
    flex-grow: 1;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: space-around;

}

.box i{
    font-size:40px
}
.box .data{
    text-align: center;
}

.box .data span{
    font-size: 30px;
}
table{
    width: 100%;
    text-align: center;
    border-spacing: 8px;

}
th,td{
    background-color: #123;
    height: 40px;
    border-radius: 8px;
}
th{
    background-color: #0481ff;
}
.price , .count{
    padding: 6px;
    border-radius: 6px;
}
.price{
    background-color: green;
}
.count{
    background-color: gold;
    color: black;
}
  
    </style>
    <script>
        // Fonction pour pré-remplir le formulaire avec les valeurs de la ligne
        function remplirFormulaire() {
            // Récupérer les valeurs passées en paramètres de la requête
            var id = "${param.id}";
            var label = "${param.label}";
            var capacity = "${param.capacity}";

            // Remplir les champs du formulaire avec les valeurs de la ligne
            document.getElementById('ftitle').value = id;
            document.getElementById('flocation').value = label;
            document.getElementById('fcapacity').value = capacity;
        }

        // Appeler la fonction lors du chargement de la page
        window.onload = remplirFormulaire;
    </script>
</head>
<body>
       <div class="menu">
        <ul>
            <li class="profile">
                <div class="img-box">
                    <img src="images/IMG-20210806-WA0011.jpg" alt="image">
                </div>
                <h2>Admin</h2>
            </li>
            <li>
                <a href="Adminborad.jsp" >
                    <i class="fas fa-home"></i>
                    <p>dashboard</p>
                </a>
            </li>
            <li>
                <a href="./AccountsServlet">
                    <i class="fas fa-users"></i>
                    <p>Account List</p>
                </a>
            </li>
            <li>
                <a href="Addagent.jsp">
                    <i class="fas fa-user-plus"></i>
                    <p>Add Account</p>
                </a>
            </li>
            <li>
                <a href="Ajouttyperoom.jsp">
                    <i class="fas fa-bed"></i>
                    <p>Add RoomType</p>
                </a>
            </li>
            <li>
                <a href="./RoomTypeServlet">
                    <i class="fas fa-list-ul"></i>
                    <p>RoomType Management</p>
                </a>
            </li>
            <li>
                <a href="#" class="active">
                    <i class="fas fa-edit"></i>
                    <p>Update RoomType</p>
                </a>
            </li>
            
            <li class="log-out">
                <a href="login.jsp">
                    <i class="fas fa-sign-out"></i>
                    <p>Log Out</p>
                </a>
            </li>
        </ul>

</div>
 <div class="content">
     <div class="title-info">
        <p>Add Account for agent</p>
        <i class="fas fa-chart-bar"></i>
     </div>
     <main class="content">
      <div class="main-header">
       
        <div class="main-form">
                    <form action="./RoomTypeServlet" method="post">
                        <input type="hidden" name="action" value="modifier">
                        <input type="text" id="ftitle" name="id" readonly>
                        <input type="text" id="flocation" name="label" placeholder="Add label">
                        <input type="number" id="fcapacity" name="capacity" placeholder="Add capacity">
                        <input type="submit" id="fsubmit" value="Update" class="button">
                    </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
