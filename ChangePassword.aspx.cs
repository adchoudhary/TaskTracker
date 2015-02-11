using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        Employee emp = DBHandler.GetAdhikariByName(Session["User"].ToString());
        emp.Password = txtPassword.Text;


        long recid = DBHandler.UpdateAdhikari(emp);

        if (recid == 0) Response.Redirect("NotConfirmation.aspx?op=Password Changed");
        else { Common.AdhikariList = DBHandler.GetAdhikari(); Response.Redirect("Confirmation.aspx"); }
    }
}