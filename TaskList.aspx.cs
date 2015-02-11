using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public List<Project> pro = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        pro = DBHandler.GetProjectByEmpID(DBHandler.GetAdhikariByName(Session["User"].ToString()).ID);
        Repeater1.DataSource = pro;
        Repeater1.DataBind();
    }
   
}