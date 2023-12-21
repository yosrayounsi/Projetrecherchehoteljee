<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
.img-box{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    border: 3px solid white;
    flex-shrink: 0;
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
    <title>Dashboard</title>
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
                <a href="#" class="active">
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
                    <p>RoomType management</p>
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
        <p>dashboard</p>
       </div>

    </div>


    

    
</body>
</html>