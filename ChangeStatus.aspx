
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeStatus.aspx.cs" Inherits="_Default" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
     <script>
         $(function () {
             $("#txtCompletedDate").datepicker({ dateFormat: "dd-MM-yy" });
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
    

       <div class="container">
                <div class="text-right"><span class="muted"><%=Session["User"].ToString() %> </span> 
                </div><br />

           <%if(proj.Status == Common.Status.Completed || proj.Status == Common.Status.Aborted)
             { %>
           
            <div class="hero-unit">
  <h1>Not applicable</h1>
  <p>Your is task is <%=proj.GetStatus %>. So the status of the task cant be changed.</p>
  
</div>

           <%}
             else
             { %>
                <h2>Change Status of the Task :- </h2>
            <form id="form1" runat="server" class="form-horizontal">


                 <div class="control-group">
                    <asp:Label ID="Label14" runat="server" Text="Change Task Status" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                         
                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"  >
                                        </asp:DropDownList>
                    </div>
                </div>

                <%if (ddlStatus.SelectedItem.Text == "Complete")
                  { %>

                <div class="control-group">
                    <asp:Label ID="Label15" runat="server" Text="Total Actual Expense" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtTotalActualExpense" runat="server"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTotalActualExpense"
                ErrorMessage="Total Actual Expense is supposed to be a decimal" CssClass="text-error" ValidationExpression="\d*\.?\d*">*</asp:RegularExpressionValidator>
                    </div>
                </div>

                  <div class="control-group">
                    <asp:Label ID="Label16" runat="server" Text="Completed Date" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                        <asp:TextBox ID="txtCompletedDate" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompletedDate"
                ErrorMessage="Completed Date is Required" CssClass="text-error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <%} %>

                 

                <div class="control-group">
                    <asp:Label ID="Label12" runat="server" Text="Task Assigned Implementation Officer" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.GivenTo.Name %>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label1" runat="server" Text="Village" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                        <%=proj.Village %>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label5" runat="server" Text="Taluka" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.Taluka %>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label ID="Label2" runat="server" Text="Work Name" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                        <%=proj.Name %>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label4" runat="server" Text="Scheme Name" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.SchemeName %>
                    </div>
                </div>
               
                <div class="control-group">
                    <asp:Label ID="Label3" runat="server" Text="Estimated Cost" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.CostEstimated.ToString() %>
                    </div>
                </div>
                 <div class="control-group">
                    <asp:Label ID="Label6" runat="server" Text="Technical Section Date" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                      <%=proj.Technical.date.ToShortDateString() %>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label7" runat="server" Text="Technical Section Amount" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.Technical.amount.ToString() %>
                        </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label8" runat="server" Text="Administrative Section Date" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                        <%=proj.Administrative.date.ToString("dd-MM-yy") %>
                    </div>
                </div>

                <div class="control-group">
                    <asp:Label ID="Label9" runat="server" Text="Administrative Section Amount" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.Administrative.amount.ToString() %>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label10" runat="server" Text="Grant Release Date" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.GrantReleaseDate.ToShortDateString() %>
                    </div>
                </div>

                 <div class="control-group">
                    <asp:Label ID="Label11" runat="server" Text="Remarks" CssClass="control-label muted"></asp:Label>
                    <div class="controls">
                       <%=proj.Remarks %>
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
           <%} %>
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
