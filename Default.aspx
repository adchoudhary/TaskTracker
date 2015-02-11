
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
      <style>

   
   
    /* CUSTOMIZE THE CAROUSEL
    -------------------------------------------------- */

    /* Carousel base class */
    .carousel {
      margin-bottom: 20px;
    }

    .carousel .container {
      position: relative;
      z-index: 9;
    }

    .carousel-control {
      height: 80px;
      margin-top: 0;
      font-size: 120px;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
      background-color: transparent;
      border: 0;
      z-index: 10;
    }

    .carousel .item {
      height: 300px;
    }
    .carousel img {
      position: absolute;
      top: 0;
      left: 0;
      min-width: 100%;
      height: 300px;
    }

    .carousel-caption {
      background-color: transparent;
      position: static;
      max-width: 250px;
      padding: 0 20px;
      margin-top: 200px;
    }
    .carousel-caption h1,
    .carousel-caption .lead {
      margin: 0;
      line-height: 1.25;
      color: #fff;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
    }
    .carousel-caption .btn {
      margin-top: 10px;
    }



    


    </style>
   
    <title>Welcome to Vikas Kutch DPO</title>
</head>
<body>
   
     <div class="page-header">
                <h1 class="text-error text-center"><b>Village Index For Kutch Approve Scheme</b></h1>
            </div>
    

    <div class="navbar">
  <div class="navbar-inner">
    <a class="brand" href="#">Vikas Kutch DPO</a>
    <ul class="nav">
     <li class="active">
                    <a href="Default.aspx">Home</a>
                </li>
                <li ><a href="AddTask.aspx">Add Task</a></li>
        <li ><a href="TaskList.aspx">Task List</a></li>
        <%
            if(Session["User"] != null)
            { 
            if (Session["User"].ToString() == Common.stradmin)
          { %>
                <li><a href="AddAdhikari.aspx">Add Implementation Officer</a></li>
        <li><a href="AdhikariList.aspx">Implementation Officer List</a></li>
        
                <li><a href="TaskListByStatus.aspx">Reports</a></li>
        <%}
          } %>
        <li><a href="ChangePassword.aspx">Change Password</a></li>
        <% if (Session["User"] == null)
           { %>
        <li><a href="Login.aspx">Login</a></li>
        <%}
          else
          { %>
        <li><a href="Logout.aspx">LogOut</a></li>
        <%} %>
    </ul>
  </div>
</div>
    

   <br />
    

     <div class="container" >
        
                         <div class="row">
                    <div class="span2"></div>
                     <div class="span8">
                          <div class="bs-docs-example">
                            <div id="myCarousel" class="carousel slide">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" ></li>
    <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- Carousel items -->
  <div class="carousel-inner">
    <div class="active item">
        <img src="img/01.jpg" />
    </div>
    <div class="item">
        <img src="img/02.jpg" />
    </div>
    <div class="item">
        <img src="img/03.jpg" />
    </div>
       <div class="item">
        <img src="img/04.gif" />
    </div>
   
  
  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div></div>
                     </div>
                     <div class="span2"></div>
                </div>


            

     

    </div>

    <br /><br />
    
<ul class="breadcrumb">

         <li class="active">
                    <a href="Default.aspx">Home</a>&nbsp;-&nbsp;
                </li>
                <li><a href="AddTask.aspx">Add Task</a>&nbsp;-&nbsp;</li>
                <li><a href="TaskList.aspx">Task List</a>&nbsp;-&nbsp;</li>
                <li><a href="ChangePassword.aspx">Change Password</a></li>
    </ul>
     <h6 class="text-info text-center"> Designed and Developed by <a href="www.ailestech.com">Ailes Technology</a></h6>

   

     <script src="js/jquery.js"></script>
     <script src="js/bootstrap-transition.js"></script>
     <script src="js/bootstrap-carousel.js"></script>
   
    <script>
        !function ($) {
            $(function () {
                // carousel demo
                $('#myCarousel').carousel()
            })
        }(window.jQuery)
    </script>

</body>
</html>
