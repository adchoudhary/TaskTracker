
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />

    <style type="text/css">
        body {
          
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 500px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }

            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }

            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;
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
     <li >
                    <a href="Default.aspx">Home</a>
                </li>
                <li><a href="AddTask.aspx">Add Task</a></li>
        <li><a href="TaskList.aspx">Task List</a></li>
        <% if (Session["User"] != null)
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
        <li class="active"><a href="Login.aspx">Login</a></li>
        <%}
          else
          { %>
        <li><a href="Logout.aspx">LogOut</a></li>
        <%} %>
    </ul>
  </div>
</div>
    

     <div class="container" >
         <br /><br />
         <div class="row">
             <div class="span2"></div>
             <div class="span6" >

        <form id="form1" runat="server" class="form-signin">
            <h2 class="form-signin-heading">Please Sign in</h2>
            User Name
                         <asp:TextBox ID="txtUserName" runat="server" MaxLength="20" CssClass="input-block-level"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                ErrorMessage="User id is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
            Password
                 <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20" CssClass="input-block-level"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                ErrorMessage="password is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
            <asp:Button ID="btnLogin" runat="server"  Text="Login" class="btn btn-large btn-danger" OnClick="btnLogin_Click" />&nbsp;  
                 <asp:Label ID="Label1" runat="server"></asp:Label><br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-error" />
        </form>

             </div>
             <div class="span1"></div>
         </div>



    </div>

    


     <ul class="breadcrumb">

         <li class="active">
                    <a href="Default.aspx">Home</a>&nbsp;-&nbsp;
                </li>
                <li><a href="Aboutus.aspx">Add Task</a>&nbsp;-&nbsp;</li>
                <li><a href="AddStudent.aspx">Task List</a>&nbsp;-&nbsp;</li>
                <li><a href="result.aspx">Change Password</a></li>
    </ul>
     <h6 class="text-info text-center"> Designed and Developed by <a href="www.ailestech.com">Ailes Technology</a></h6>


</body>
</html>
