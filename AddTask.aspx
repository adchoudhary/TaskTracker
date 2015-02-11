
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTask.aspx.cs" Inherits="_Default" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
     <script>
         $(function () {
             $("#txtTechnicalDate").datepicker({ dateFormat: "dd-MM-yy" });
             $("#txtAdministrativeDate").datepicker({ dateFormat: "dd-MM-yy" });
             $("#txtGrantReleaseDate").datepicker({ dateFormat: "dd-MM-yy" });
         });
  </script>

   
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
                <li class="active"><a href="AddTask.aspx">Add Task</a></li>
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
    

       <div class="container">
                <div class="text-right"><span class="muted"><%=Session["User"].ToString() %> </span> 
                </div>
            <h2>Add new Task :- </h2>
            <form id="form1" runat="server" class="form-horizontal">

                <div class="control-group">
                    <asp:Label ID="Label12" runat="server" Text="Task Assigned Implementation Officer" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:DropDownList ID="ddpadhikari" runat="server"></asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddpadhikari"
                ErrorMessage="Select Implementation Officer whom the task is assigned" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label1" runat="server" Text="Village" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtVillage" runat="server" CssClass=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVillage"
                ErrorMessage="Village Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label5" runat="server" Text="Taluka" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtTaluka" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTaluka"
                ErrorMessage="Taluka is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label ID="Label2" runat="server" Text="Work Name" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtProjectName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProjectName"
                ErrorMessage="Work Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label4" runat="server" Text="Scheme Name" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtSchemeName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSchemeName"
                ErrorMessage="Scheme Name is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
               
                <div class="control-group">
                    <asp:Label ID="Label3" runat="server" Text="Estimated Cost" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtCostEstimated" runat="server"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCostEstimated"
                ErrorMessage="Estimated Cost is supposed to be a decimal" CssClass="text-error" ValidationExpression="\d*\.?\d*">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                 <div class="control-group">
                    <asp:Label ID="Label6" runat="server" Text="Technical Sanction Date" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtTechnicalDate" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTechnicalDate"
                ErrorMessage="Technical Section Date is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label7" runat="server" Text="Technical Sanction Amount" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtTechnicalAmount" runat="server"></asp:TextBox>
                          <asp:RegularExpressionValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTechnicalAmount"
                ErrorMessage="Technical Section Amount is supposed to be a decimal" CssClass="text-error" ValidationExpression="\d*\.?\d*">*</asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label8" runat="server" Text="Administrative Sanction Date" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtAdministrativeDate" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAdministrativeDate"
                ErrorMessage="Administrative Section Date is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label9" runat="server" Text="Administrative Sanction Amount" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtAdministrativeAmount" runat="server"></asp:TextBox>
                          <asp:RegularExpressionValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAdministrativeAmount"
                ErrorMessage="Administrative Section Amount is supposed to be a decimal" CssClass="text-error" ValidationExpression="\d*\.?\d*">*</asp:RegularExpressionValidator>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label10" runat="server" Text="Grant Release Date" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtGrantReleaseDate" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtGrantReleaseDate"
                ErrorMessage="Grant Release Date is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label11" runat="server" Text="Remarks" CssClass="control-label"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtRemarks" runat="server" Height="54px" Width="386px" TextMode="MultiLine"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtRemarks"
                ErrorMessage="Remarks is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
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
