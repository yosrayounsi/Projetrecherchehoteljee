<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.zoomable-image {
      transition: transform 0.3s; /* Transition de 0.3 secondes pour une animation fluide */
    }

    .zoomable-image:hover {
      transform: scale(1.5); /* Zoom à 120% au survol */
    }
:root {
  --gradient: linear-gradient(to left top, #DD2476 10%, #FF512F 90%) !important;
}

body {
  background: #111 !important;
}

.card {
  background: #222;
  border: 1px solid #dd2476;
  color: rgba(250, 250, 250, 0.8);
  margin-bottom: 2rem;
}

.btn {
  border: 5px solid;
  border-image-slice: 1;
  background: var(--gradient) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
  border-image-source:  var(--gradient) !important; 
  text-decoration: none;
  transition: all .4s ease;
   display: flex;
  justify-content: center;
  align-items: center;
 
   width: 150px;
  
}

.btn:hover, .btn:focus {
      background: var(--gradient) !important;
  -webkit-background-clip: none !important;
  -webkit-text-fill-color: #fff !important;
  border: 5px solid #fff !important; 
  box-shadow: #222 1px 0 10px;
  text-decoration: underline;
}
</style>

<body>

<div class="container mx-auto mt-4">
  <div class="row">
   <c:if test="${not empty hotels}">
   <c:forEach var="hotel" items="${hotels}">
    <div class="col-md-4">
      <div class="card" style="width: 18rem;">
  <img class="zoomable-image card-img-top" src="${hotel.path}" alt="...">
  <div class="card-body">
    <h5 class="card-title">${hotel.name}</h5>
        <h6 class="card-subtitle mb-2 ">Number of stars: ${hotel.stars}</h6>
    <p class="card-text">City: ${hotel.city}</p>
       <p class="card-text">Description: ${hotel.description}</p>
   
  </div>
  </div>
    </div>   
 </c:forEach>
     </c:if>
       
   
    
   

    
   
         
          
    
   
    
 
</div>
  </div>
</body>
</html>