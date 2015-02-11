
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskListByAdhikari.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />

   
    <script lang="javascript" type="text/javascript">
        function PrintDivData(crtlid) {
            var ctrlcontent = document.getElementById(crtlid);
            var printscreen =
            window.open('', '', 'left=1,top=1,width=500,height=600,toolbar=0,scrollbars=0,status=0');
            printscreen.document.write(ctrlcontent.innerHTML);
            printscreen.document.close();
            printscreen.focus();
            printscreen.print();
            printscreen.close();
        }
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
                <li ><a href="AddTask.aspx">Add Task</a></li>
        <li ><a href="TaskList.aspx">Task List</a></li>
        <%if (Session["User"].ToString() == Common.stradmin)
          { %>
                <li><a href="AddAdhikari.aspx">Add Implementation Officer</a></li>
        <li><a href="AdhikariList.aspx">Implementation Officer List</a></li>
        
                <li class="active"><a href="TaskListByStatus.aspx">Reports</a></li>
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
    
     <form id="form1" runat="server">
   <div class="container" >
         <div class="text-right"><span class="muted"><%=Session["User"].ToString() %> </span> 
                </div>



       <br />
       <div class="row">
                                <div class="span8">
                                    <asp:HyperLink ID="hp1" runat="server" NavigateUrl="~/TaskListByStatus.aspx" >Click to Search by Task Status</asp:HyperLink>
                                </div>
                            </div>


       <br />
        <div class="row">
                                <div class="span8">
                                    <p><span class="muted">Select Implementation Officer </span>
                                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" >
                                        </asp:DropDownList>
                                    </p>
                                </div>
                            </div>
       <br />

       <div id="Print">
         <table class="table table-striped">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
        
        <td>
        <strong>Project Name</strong>
        </td>
            <td>
        <strong>Owner Name</strong>
        </td>
        <td >
        <strong>Taluka</strong>
        </td>
        <td >
        <strong>Village</strong>
        </td>
            <td>
        <strong>Task Assigned To</strong>
        </td>
             <td >
        <strong>Status</strong>
        </td>
 
        
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
        <td >
            <asp:Label ID="lblSender" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.name")%>'></asp:Label>
        </td>
             <td>
         <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.OwnerName")%>'></asp:Label>        </td>
       
        <td>
         <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Taluka")%>'></asp:Label>        </td>
        <td >
            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Village")%>'></asp:Label>
        </td>
            <td>
         <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.GivenToName")%>'></asp:Label>        </td>
        <td>
         <asp:Label ID="Label4" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.GetStatus")%>'></asp:Label>        </td>
       
           
        </tr>
        </ItemTemplate>    

                    </asp:Repeater>

                </table>
       </div>

       <div class="row">
           <div class="span8">
               <input id="btnPrint" name="Print" runat="server" type="button" value="Print" onclick="javascript: PrintDivData('Print');" />  
           </div>
       </div>

    </div>
</form>

    


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
