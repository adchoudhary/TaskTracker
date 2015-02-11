
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditAdhikari.aspx.cs" Inherits="_Default" %>

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
                <li class="active"><a href="AddAdhikari.aspx">Add Implementation Officer</a></li>
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
    

     <div class="container">
                <div class="text-right"><span class="muted"><%=Session["User"].ToString() %> </span> 
                </div>
            <h2>Edit Implementation Officer with Login Details :- </h2>
            <form id="form1" runat="server" class="form-horizontal">
                <div class="control-group">
                    <asp:Label ID="Label1" runat="server" Text="Name" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtName" runat="server" CssClass=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                ErrorMessage="Student Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label5" runat="server" Text="UserName for Login" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName"
                ErrorMessage="Date is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label ID="Label2" runat="server" Text="Password for Login" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword"
                ErrorMessage="Student's Parent Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label4" runat="server" Text="Label" CssClass="control-label">Address</asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtaddress"
                ErrorMessage="Address is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
               
                <div class="control-group">
                    <asp:Label ID="Label3" runat="server" Text="Phone No" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhoneNo"
                ErrorMessage="Student's Parent's Occupation is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="control-group">
                    <asp:Label ID="Label6" runat="server" Text="Mobile No" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                       <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMobileNo1"
                ErrorMessage="Student's Parent's Occupation is Required" CssClass="text-error">*</asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                 <div class="control-group">
                   
                    <div class="controls">
                        <asp:Button CssClass="btn" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  />
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
