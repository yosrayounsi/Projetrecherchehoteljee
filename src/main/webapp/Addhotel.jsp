<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <!-- Font Awesome CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts Roboto -->
  
<style>
body {
  font-family: "Josefin Sans", sans-serif;
  background: #b88cd2;
}

.login {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 100%;
}
.login__form {
  background: #FFF;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.4);
  padding: 80px;
}
.login__form-input {
  background: #e8e8e8;
  border: 1px solid #e8e8e8;
  box-shadow: none;
  padding: 30px;
}
.login__form-btn {
  background: #b88cd2;
  border: none;
  color: #FFF;
  height: 50px;
  width: 100%;
  text-transform: uppercase;
}
:root {
    --font-family-sans-serif: "Open Sans", -apple-system, BlinkMacSystemFont,
    "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}

*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

html {
    font-family: sans-serif;
    line-height: 1.15;
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

nav {
    display: block;
}

body {
    margin: 0;
    font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #515151;
    text-align: left;
    background-color: #e9edf4;
}

h1, h2, h3, h4, h5, h6 {
    margin-top: 0;
    margin-bottom: 0.5rem;
}

p {
    margin-top: 0;
    margin-bottom: 1rem;
}

a {
    color: #3f84fc;
    text-decoration: none;
    background-color: transparent;
}

a:hover {
    color: #0458eb;
    text-decoration: underline;
}

h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    font-family: "Nunito", sans-serif;
    margin-bottom: 0.5rem;
    font-weight: 500;
    line-height: 1.2;
}

h1, .h1 {
    font-size: 2.5rem;
    font-weight: normal;
}

.card {
    position: relative;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, 0.125);
    border-radius: 0;
}

.card-body {
    -webkit-box-flex: 1;
    -webkit-flex: 1 1 auto;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
}

.card-header {
    padding: 0.75rem 1.25rem;
    margin-bottom: 0;
    background-color: rgba(0, 0, 0, 0.03);
    border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    text-align: center;
}

.dashboard {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    min-height: 100vh;
}

.dashboard-app {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-flex: 2;
    -webkit-flex-grow: 2;
    -ms-flex-positive: 2;
    flex-grow: 2;
    margin-top: 84px;
}

.dashboard-content {
    -webkit-box-flex: 2;
    -webkit-flex-grow: 2;
    -ms-flex-positive: 2;
    flex-grow: 2;
    padding: 25px;
}

.dashboard-nav {
    min-width: 238px;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    overflow: auto;
    background-color: #373193;
}

.dashboard-compact .dashboard-nav {
    display: none;
}

.dashboard-nav header {
    min-height: 84px;
    padding: 8px 27px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
}

.dashboard-nav header .menu-toggle {
    display: none;
    margin-right: auto;
}

.dashboard-nav a {
    color: #515151;
}

.dashboard-nav a:hover {
    text-decoration: none;
}

.dashboard-nav {
    background-color: #443ea2;
}

.dashboard-nav a {
    color: #fff;
}

.brand-logo {
    font-family: "Nunito", sans-serif;
    font-weight: bold;
    font-size: 20px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    color: #515151;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
}

.brand-logo:focus, .brand-logo:active, .brand-logo:hover {
    color: #dbdbdb;
    text-decoration: none;
}

.brand-logo i {
    color: #d2d1d1;
    font-size: 27px;
    margin-right: 10px;
}

.dashboard-nav-list {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}

.dashboard-nav-item {
    min-height: 56px;
    padding: 8px 20px 8px 70px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    letter-spacing: 0.02em;
    transition: ease-out 0.5s;
}

.dashboard-nav-item i {
    width: 36px;
    font-size: 19px;
    margin-left: -40px;
}

.dashboard-nav-item:hover {
    background: rgba(255, 255, 255, 0.04);
}

.active {
    background: rgba(0, 0, 0, 0.1);
}

.dashboard-nav-dropdown {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}

.dashboard-nav-dropdown.show {
    background: rgba(255, 255, 255, 0.04);
}

.dashboard-nav-dropdown.show > .dashboard-nav-dropdown-toggle {
    font-weight: bold;
}

.dashboard-nav-dropdown.show > .dashboard-nav-dropdown-toggle:after {
    -webkit-transform: none;
    -o-transform: none;
    transform: none;
}

.dashboard-nav-dropdown.show > .dashboard-nav-dropdown-menu {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
}

.dashboard-nav-dropdown-toggle:after {
    content: "";
    margin-left: auto;
    display: inline-block;
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid rgba(81, 81, 81, 0.8);
    -webkit-transform: rotate(90deg);
    -o-transform: rotate(90deg);
    transform: rotate(90deg);
}

.dashboard-nav .dashboard-nav-dropdown-toggle:after {
    border-top-color: rgba(255, 255, 255, 0.72);
}

.dashboard-nav-dropdown-menu {
    display: none;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}

.dashboard-nav-dropdown-item {
    min-height: 40px;
    padding: 8px 20px 8px 70px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    transition: ease-out 0.5s;
}

.dashboard-nav-dropdown-item:hover {
    background: rgba(255, 255, 255, 0.04);
}

.menu-toggle {
    position: relative;
    width: 42px;
    height: 42px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    color: #443ea2;
}

.menu-toggle:hover, .menu-toggle:active, .menu-toggle:focus {
    text-decoration: none;
    color: #875de5;
}

.menu-toggle i {
    font-size: 20px;
}

.dashboard-toolbar {
    min-height: 84px;
    background-color: #dfdfdf;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    padding: 8px 27px;
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1000;
}

.nav-item-divider {
    height: 1px;
    margin: 1rem 0;
    overflow: hidden;
    background-color: rgba(236, 238, 239, 0.3);
}

@media (min-width: 992px) {
    .dashboard-app {
        margin-left: 238px;
    }

    .dashboard-compact .dashboard-app {
        margin-left: 0;
    }
}


@media (max-width: 768px) {
    .dashboard-content {
        padding: 15px 0px;
    }
}

@media (max-width: 992px) {
    .dashboard-nav {
        display: none;
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        z-index: 1070;
    }

    .dashboard-nav.mobile-show {
        display: block;
    }
}

@media (max-width: 992px) {
    .dashboard-nav header .menu-toggle {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }
}

@media (min-width: 992px) {
    .dashboard-toolbar {
        left: 238px;
    }

    .dashboard-compact .dashboard-toolbar {
        left: 0;
    }
}
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;900&display=swap");

body {
  font: 400 14px Roboto, sans-serif;
  background: #f6f4fc;
  -webkit-font-smoothing: antialiased;
  margin: 0;
  padding: 0;
  outline: 0;
  box-sizing: border-box;
}

em {
  font-style: normal;
}

a {
  text-decoration: none;
  color: inherit;
}

.layout {
  display: flex;
  align-items: center;
  justify-content: right;
  padding: 0 16px;
  background-color: #f6f4fc;
  margin: 0 20px;
}

.content {
  display: flex;
  justify-content: center;
  align-items: top;
  flex: 1;
  margin: 5.5em 0;
  width: 100%;
  min-width: 260px;
}

.main-header {
  background-color: #fefefe;
  border-radius: 40px;
  padding: 20px;
  width: 100%;
  max-width: 650px;
}

.main-title {
  width: 100%;
}

.main-header .main-title h1 {
  margin: 30px;
  font-size: 42px;
  color: #3ba8d4;
}

.main-form {
  display: flex;
  align-items: center;
  justify-content: center;
}

.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 4em;
  background-color: #f6f4fc;
  border-top: 1px solid #b3b3b3;
}

.footer_sign {
  position: absolute;
  top: 50%;
  right: 1em;
  transform: translateY(-50%);
  font-size: 14px;
  color: #b3b3b3;
}

.footer_sign span,
a {
  color: #49c1c3;
  text-decoration: none;
}

.header {
  z-index: 2;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 4em;
  background-color: #f6f4fc;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1.5em;
  border-bottom: 1px solid #3ba8d4;
}

.header-user {
  font-size: 1.2em;
  color: #3ba8d4;
}

.header-user > i {
  padding-right: 10px;
}

/* ==== sidebar ==== */

*,
*::before,
*::after {
  box-sizing: border-box;
}

.sidebar {
  position: fixed;
  top: 0;
  left: -15em;
  overflow: hidden;
  transition: all 0.3s ease-in;
  width: 15em;
  height: 100%;
  background: #fefefe;
  font-size: 1.2em;
}



.sidebar:hover,
.sidebar:focus,
.header:focus + .sidebar,
.header:hover + .sidebar {
  left: 0;
}

.sidebar ul {
  position: absolute;
  top: 4em;
  left: 0;
  margin: 0;
  padding: 0;
  width: 15em;
}

.sidebar ul li {
  width: 100%;
}

.sidebar-list-item {
  position: relative;
  display: inline-block;
  width: 100%;
  height: 3em;
  color: #394951;
}

.sidebar-list-item em {
  position: absolute;
  top: 50%;
  left: 4em;
  transform: translateY(-50%);
}

.sidebar-list-item:hover {
  background: #f5f8fe;
}

.sidebar-list-item > i {
  position: absolute;
  top: 0;
  left: 0;
  display: inline-block;
  width: 4em;
  height: 3em;
}

.sidebar-list-item > i::before {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

@media (min-width: 42em) {
  .content {
    margin-left: 5em;
  }

  .sidebar {
    width: 4em;
    left: 0;
  }

  .sidebar:hover,
  .sidebar:focus,
  .header:hover + .sidebar,
  .header:focus + .sidebar {
    width: 15em;
  }
}

@media (min-width: 68em) {
  .content {
    margin-left: 18em;
  }

  .sidebar {
    width: 15em;
  }
}

/* ==== form ==== */

input,
button,
textarea {
  font: 400 14px Roboto, sans-serif;
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

.input-hour {
  height: 50px;
}

#fhourdiv {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

#fhourdiv > input {
  width: 47%;
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
}

.button:hover {
  filter: brightness(90%);
}
</style></head>

<body>
  <div class='dashboard'>
    <div class="dashboard-nav">
        <header><a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a><a href="#"
                                                                                   class="brand-logo"><i
                class="fas fa-anchor"></i> <span>Agent Board</span></a></header>
        <nav class="dashboard-nav-list"><a href="Agentdashboard.jsp" class="dashboard-nav-item "><i class="fas fa-home"></i>
            Home </a><a
                href="Addhotel.jsp" class="dashboard-nav-item active"><i class="fas fa-tachometer-alt"></i>Add Hotel
        </a><a
                href="./HotelServlet" class="dashboard-nav-item"><i class="fas fa-file-upload"></i> Check list hotels </a>
            <div class='dashboard-nav-dropdown'>
          <a
                    href="login.jsp" class="dashboard-nav-item"><i class="fas fa-sign-out-alt"></i> Logout </a>
        </nav>
    </div>
   <main class="content">
      
        
          
            <form  class="login__form" action="./HotelServlet" method="post" enctype="multipart/form-data">
             <div class="login__form-row form-group">
            <input type="hidden" name="action" value="ajouter">
             <input type="text" class="login__form-input form-control"  id="ftitle" name="name" placeholder="Nom">
           </div>
           <div class="login__form-row form-group">
             <input type="text" class="login__form-input form-control" id="flocation" name="city" placeholder="Add location">
           </div>
             <div class="login__form-row form-group">
             <input type="text" class="login__form-input form-control"id="flocation" name="stars" placeholder="Add Number stars">
           </div>
            <div class="login__form-row form-group">
             <input type="text" class="login__form-input form-control"id="fdescription" name="description" placeholder="Add description">
           </div>
            <div class="login__form-row form-group">
             <input type="file" class="login__form-input form-control"id="fimage" name="image" placeholder="Add image" accept="image/*">
           </div>
           <input type="submit" id="fsubmit"  value="Add" class="btn btn-default login__form-btn">
         </form>
      </div>
		</div>   
	</div>   
</div>    

</body>
</html>