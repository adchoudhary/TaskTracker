<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />

   
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
     <li >
                    <a href="Default.aspx">Home</a>
                </li>
                <li><a href="AddTask.aspx">Add Task</a></li>
        <li><a href="TaskList.aspx">Task List</a></li>
        <%if (Session["User"].ToString() == Common.stradmin)
          { %>
                <li><a href="AddAdhikari.aspx">Add Implementation Officer</a></li>
        <li><a href="AdhikariList.aspx">Implementation Officer List</a></li>
        
                <li><a href="TaskListByStatus.aspx">Reports</a></li>
        <%} %>
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
    

     <div class="container" >
        
         
            <div class="hero-unit">
  <h1 class="text-error">Error</h1>
  <p>Your Record has not been <%=Request.QueryString["op"].ToString() %> successfully. You can contact your system administrator.</p>
  
</div>


    </div>

    


     <ul class="breadcrumb">

         <li class="active">
                    <a href="Default.aspx">Home</a>&nbsp;-&nbsp;
                </li>
                <li><a href="AddTask.aspx">Add Task</a>&nbsp;-&nbsp;</li>
                <li><a href="TaskList.aspx">Task List</a>&nbsp;-&nbsp;</li>
                <li><a href="ChangePassword.aspx">Change Password</a></li>
    </ul>
     <h6 class="text-info text-center"> Designed and Developed by <a href="www.ailestech.com">Ailes Technology</a></h6>


</body>
</html>

