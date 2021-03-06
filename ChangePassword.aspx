﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

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
                <li ><a href="AddTask.aspx">Add Task</a></li>
        <li><a href="TaskList.aspx">Task List</a></li>
        <%if (Session["User"].ToString() == Common.stradmin)
          { %>
                <li><a href="AddAdhikari.aspx">Add Implementation Officer</a></li>
        <li><a href="AdhikariList.aspx">Implementation Officer List</a></li>
        
                <li><a href="TaskListByStatus.aspx">Reports</a></li>
        <%} %>
        <li class="active"><a href="ChangePassword.aspx">Change Password</a></li>
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

          <h2>Enter new Password for change :- </h2>
            <form id="form1" runat="server" class="form-horizontal">
         <div class="control-group">
                    <asp:Label ID="Label2" runat="server" Text="Password" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword"
                ErrorMessage="Student's Parent Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

          <div class="control-group">
                    <asp:Label ID="Label1" runat="server" Text="Retype Password" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtPasswordretype" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPasswordretype"
                ErrorMessage="Student's Parent Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordretype" ErrorMessage="Password not matching"></asp:CompareValidator>
                    </div>
                </div>

                 <div class="control-group">
                   
                    <div class="controls">
                        <asp:Button CssClass="btn" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"   />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-error"/>
                    </div>
                </div>

                </form>

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
